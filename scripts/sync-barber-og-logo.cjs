#!/usr/bin/env node
/**
 * Grava web/barber-shop-logo.png (+ build/web se existir) a partir do logoUrl
 * do shop Firestore (https ou data URI). Path estavel para og:image / twitter:image.
 */
const fs = require('node:fs');
const path = require('node:path');
const https = require('node:https');

const ROOT = path.join(__dirname, '..');
const WEB_OUT = path.join(ROOT, 'web', 'barber-shop-logo.png');
const BUILD_OUT = path.join(ROOT, 'build', 'web', 'barber-shop-logo.png');
const API_KEY = 'AIzaSyAJWveXJvWuOfk2Y-4AcyQ9Tb9FDql3IGA';
const SHOP_URL =
  'https://firestore.googleapis.com/v1/projects/perfectgest-barber/databases/(default)/documents/shops/perfectgest_dev?key=' +
  API_KEY;

function getJson(url) {
  return new Promise((resolve, reject) => {
    https
      .get(url, (res) => {
        let raw = '';
        res.on('data', (c) => {
          raw += c;
        });
        res.on('end', () => {
          if (res.statusCode && res.statusCode >= 400) {
            reject(new Error(`HTTP ${res.statusCode}: ${raw.slice(0, 200)}`));
            return;
          }
          try {
            resolve(JSON.parse(raw));
          } catch (e) {
            reject(e);
          }
        });
      })
      .on('error', reject);
  });
}

function getBuffer(url) {
  return new Promise((resolve, reject) => {
    https
      .get(url, (res) => {
        if (res.statusCode && res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
          getBuffer(res.headers.location).then(resolve, reject);
          return;
        }
        const chunks = [];
        res.on('data', (c) => chunks.push(c));
        res.on('end', () => {
          if (res.statusCode && res.statusCode >= 400) {
            reject(new Error(`HTTP ${res.statusCode}`));
            return;
          }
          resolve(Buffer.concat(chunks));
        });
      })
      .on('error', reject);
  });
}

function decodeLogo(logoUrl) {
  const url = String(logoUrl || '').trim();
  if (!url) return null;
  const m = /^data:image\/[a-zA-Z0-9.+-]+;base64,(.+)$/s.exec(url);
  if (m) return Buffer.from(m[1], 'base64');
  if (/^https?:\/\//i.test(url)) return null; // fetch async
  return null;
}

async function main() {
  let buf = null;
  let shopName = '';
  try {
    const doc = await getJson(SHOP_URL);
    shopName = doc?.fields?.name?.stringValue || '';
    const logoUrl = doc?.fields?.logoUrl?.stringValue || '';
    buf = decodeLogo(logoUrl);
    if (!buf && /^https?:\/\//i.test(logoUrl.trim())) {
      buf = await getBuffer(logoUrl.trim());
    }
  } catch (e) {
    console.warn('sync-barber-og-logo: fetch shop falhou:', e.message || e);
  }

  if (shopName) {
    console.log(`SHOP_NAME=${shopName}`);
  }

  if (!buf || buf.length < 32) {
    if (fs.existsSync(WEB_OUT)) {
      console.log('sync-barber-og-logo: mantem ficheiro existente (sem logo novo).');
      return { ok: true, kept: true, shopName };
    }
    console.warn('sync-barber-og-logo: sem logo; stubs usarao path mesmo assim.');
    return { ok: false, shopName };
  }

  fs.writeFileSync(WEB_OUT, buf);
  const buildDir = path.dirname(BUILD_OUT);
  if (fs.existsSync(buildDir)) {
    fs.writeFileSync(BUILD_OUT, buf);
  }
  console.log(
    `sync-barber-og-logo: ${buf.length} bytes -> web/barber-shop-logo.png` +
      (shopName ? ` (${shopName})` : ''),
  );
  return { ok: true, shopName, bytes: buf.length };
}

if (require.main === module) {
  main().catch((e) => {
    console.error(e);
    process.exit(1);
  });
}

module.exports = { main, WEB_OUT, BUILD_OUT };
