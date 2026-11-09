#!/usr/bin/env node
const path = require('node:path');
const { spawnSync } = require('node:child_process');

const isWin = process.platform === 'win32';

function spawnOpts(command, args, extra) {
  if (isWin && (command === 'dart' || command === 'flutter')) {
    return {
      cmd: process.env.ComSpec || 'cmd.exe',
      args: ['/d', '/s', '/c', command, ...args],
      extra,
    };
  }
  return { cmd: command, args, extra };
}

function run(command, args) {
  const { cmd, args: cmdArgs, extra } = spawnOpts(command, args, { stdio: 'inherit' });
  const result = spawnSync(cmd, cmdArgs, extra);

  if (result.error) {
    console.error(`[publish-web] falhou ao iniciar ${command}: ${result.error.message}`);
    process.exit(1);
  }
  if (result.status !== 0) {
    console.error(`[publish-web] ${command} saiu com codigo ${result.status ?? 1}`);
    process.exit(result.status ?? 1);
  }
}

function output(command, args) {
  const { cmd, args: cmdArgs, extra } = spawnOpts(command, args, { encoding: 'utf8' });
  const result = spawnSync(cmd, cmdArgs, extra);
  if (result.error) {
    console.error(`[publish-web] falhou ao iniciar ${command}: ${result.error.message}`);
    process.exit(1);
  }
  if (result.status !== 0) {
    console.error(`[publish-web] ${command} saiu com codigo ${result.status ?? 1}`);
    process.exit(result.status ?? 1);
  }
  return (result.stdout || '').trim();
}

function parseCommitMessage(argv) {
  const msgEqArg = argv.find((arg) => arg.startsWith('--msg='));
  if (msgEqArg) {
    const firstChunk = msgEqArg.replace('--msg=', '').trim();
    const msgEqIndex = argv.indexOf(msgEqArg);
    const tailChunks = argv.slice(msgEqIndex + 1).map((part) => part.trim()).filter(Boolean);
    return [firstChunk, ...tailChunks].join(' ').trim();
  }

  const msgFlagIndex = argv.indexOf('--msg');
  if (msgFlagIndex >= 0) {
    const nextChunk = argv[msgFlagIndex + 1] ?? '';
    const tailChunks = argv.slice(msgFlagIndex + 2).map((part) => part.trim()).filter(Boolean);
    return [nextChunk.trim(), ...tailChunks].join(' ').trim();
  }

  return '';
}

const commitMessage = parseCommitMessage(process.argv.slice(2));

if (!commitMessage) {
  console.error('Uso: npm run publish-web -- --msg="fix: sua mensagem"');
  process.exit(1);
}

run('dart', ['run', 'tool/generate_brand_icons.dart']);
run('flutter', ['build', 'web', '--release', '--pwa-strategy=none', '--no-web-resources-cdn']);
run('node', [path.join(__dirname, 'sync-brand-assets-to-build.cjs')]);
run('node', [path.join(__dirname, 'spa-legal-paths.cjs')]);
run('node', [path.join(__dirname, 'verify-legal-build.cjs')]);
run('git', [
  'add',
  '-A',
  'lib',
  'web',
  'assets',
  'imagens',
  'IMAGENS_APP/Screenshot',
  'IMAGENS_APP/IMAGENS NOVA PAGE',
  'pubspec.yaml',
  'pubspec.lock',
  'package.json',
  'package-lock.json',
  'render.yaml',
  'scripts',
  'tool',
  'exports',
  '.gitignore',
  'README.md',
  'docs',
]);
run('git', ['add', '-A', '-f', 'build/web']);

function stagedOrHeadHasMarkers() {
  const tryPaths = [':build/web/main.dart.js', 'HEAD:build/web/main.dart.js'];
  for (const revPath of tryPaths) {
    const probe = spawnSync('git', ['show', revPath], { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
    if (probe.status !== 0 || !probe.stdout) continue;
    const js = probe.stdout;
    if (js.includes('stockQty') && js.includes('Produtos')) {
      return true;
    }
  }
  return false;
}

if (!stagedOrHeadHasMarkers()) {
  console.error(
    '[publish-web] build/web/main.dart.js sem stockQty+Produtos apos force-add. Abortar: artefacto loja ausente.',
  );
  process.exit(1);
}
console.log('[publish-web] Marcadores loja OK no artefacto (stockQty + Produtos).');

const staged = output('git', ['diff', '--cached', '--name-only']);
if (!staged) {
  console.log('Sem alterações novas para commit; a garantir push de main (artefacto loja ja no tip).');
} else {
  run('git', ['commit', '-m', commitMessage]);
}

run('git', ['push', 'origin', 'main']);

const hook = (process.env.RENDER_DEPLOY_HOOK || '').trim();
if (hook) {
  console.log('[publish-web] RENDER_DEPLOY_HOOK definido: a disparar deploy Render...');
  try {
    const res = spawnSync(
      'curl',
      ['-sS', '-o', '-', '-w', '\nHTTP_CODE:%{http_code}\n', '-X', 'POST', hook],
      { encoding: 'utf8' },
    );
    if (res.error) {
      console.error(`[publish-web] falha ao POST hook: ${res.error.message}`);
      process.exit(1);
    }
    process.stdout.write(res.stdout || '');
    if (res.stderr) process.stderr.write(res.stderr);
    const codeMatch = (res.stdout || '').match(/HTTP_CODE:(\d+)/);
    const httpCode = codeMatch ? Number(codeMatch[1]) : (res.status === 0 ? 200 : 0);
    if (httpCode < 200 || httpCode >= 300) {
      console.error(`[publish-web] RENDER_DEPLOY_HOOK respondeu HTTP ${httpCode}. Use Manual Deploy no dashboard.`);
      process.exit(1);
    }
    console.log('[publish-web] Deploy hook OK.');
  } catch (err) {
    console.error(`[publish-web] RENDER_DEPLOY_HOOK falhou: ${err && err.message ? err.message : err}`);
    process.exit(1);
  }
} else {
  console.log(
    '[publish-web] RENDER_DEPLOY_HOOK ausente. Se o live continuar com etag antigo, faca Manual Deploy (Clear build cache) no servico Render de perfectgestdev.com.',
  );
}
