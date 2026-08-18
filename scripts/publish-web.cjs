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
run('flutter', ['build', 'web', '--release', '--pwa-strategy=none']);
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

const staged = output('git', ['diff', '--cached', '--name-only']);
if (!staged) {
  console.log('Sem alterações de código-fonte para commit.');
  process.exit(0);
}

run('git', ['commit', '-m', commitMessage]);
run('git', ['push', 'origin', 'main']);
