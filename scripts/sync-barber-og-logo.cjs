#!/usr/bin/env node
/**
 * Cartao do WhatsApp por loja.
 * Cada shop ganha build/web/barber-logo/{shopId}.png (logoUrl ou icone do app).
 * Sem logo: copia web/barber-app-logo.png.
 * O PNG unico da loja piloto deixa de ser o cartao de todas.
 */
const fs = require('node:fs');
const path = require('node:path');
const https = require('node:https');

const ROOT = path.join(__dirname, '..');
const APP_LOGO = path.join(ROOT, 'web', 'barber-app-logo.png');
const BUILD_WEB = path.join(ROOT, 'build', 'web');
const BUILD_LOGO_DIR = path.join(BUILD_WEB, 'barber-logo');
const SHOPS_JSON = path.join(BUILD_WEB, 'barber-og-shops.json');
const API_KEY = 'AIzaSyAJWveXJvWuOfk2Y-4AcyQ9Tb9FDql3IGA';
const SHOPS_URL =
  'https://firestore.googleapis.com/v1/projects/perfectgest-barber/databases/(default)/documents/shops?pageSize=200&key=' +
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
            reject(new Error(`HTTP ${res.statusCode}: ${raw.slice(0, 180)}`));
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
  const m = /^data:image\/[a-zA-Z0-9.+-]+;base64,(.+)$/s.exec(url);
  if (m) return Buffer.from(m[1], 'base64');
  return null;
}

function shopIdFromName(docName) {
  const id = String(docName || '').split('/').pop() || '';
  return /^[A-Za-z0-9_-]{3,48}$/.test(id) ? id : '';
}

async function listShops() {
  const shops = [];
  let pageToken = '';
  do {
    const url = pageToken
      ? `${SHOPS_URL}&pageToken=${encodeURIComponent(pageToken)}`
      : SHOPS_URL;
    const page = await getJson(url);
    for (const doc of page.documents || []) {
      const id = shopIdFromName(doc.name);
      if (!id) continue;
      shops.push({
        id,
        name: doc.fields?.name?.stringValue || '',
        logoUrl: doc.fields?.logoUrl?.stringValue || '',
      });
    }
    pageToken = page.nextPageToken || '';
  } while (pageToken);
  return shops;
}

function copyAppLogo(dest) {
  fs.mkdirSync(path.dirname(dest), { recursive: true });
  fs.copyFileSync(APP_LOGO, dest);
}

async function logoBuffer(logoUrl) {
  const decoded = decodeLogo(logoUrl);
  if (decoded && decoded.length >= 32) return decoded;
  const url = String(logoUrl || '').trim();
  if (/^https?:\/\//i.test(url)) {
    const buf = await getBuffer(url);
    if (buf && buf.length >= 32) return buf;
  }
  return null;
}

async function main() {
  if (!fs.existsSync(APP_LOGO)) {
    throw new Error('web/barber-app-logo.png ausente');
  }
  if (fs.existsSync(BUILD_WEB)) {
    copyAppLogo(path.join(BUILD_WEB, 'barber-app-logo.png'));
    fs.mkdirSync(BUILD_LOGO_DIR, { recursive: true });
  }

  let shops = [];
  try {
    shops = await listShops();
  } catch (e) {
    console.warn('sync-barber-og-logo: lista de lojas falhou:', e.message || e);
  }

  const written = [];
  for (const shop of shops) {
    let buf = null;
    try {
      buf = await logoBuffer(shop.logoUrl);
    } catch (e) {
      console.warn(`sync-barber-og-logo: logo ${shop.id} falhou:`, e.message || e);
    }
    const hasLogo = !!(buf && buf.length >= 32);
    if (fs.existsSync(BUILD_LOGO_DIR)) {
      const dest = path.join(BUILD_LOGO_DIR, `${shop.id}.png`);
      if (hasLogo) fs.writeFileSync(dest, buf);
      else copyAppLogo(dest);
    }
    written.push({ id: shop.id, name: shop.name || shop.id, hasLogo });
    console.log(
      `sync-barber-og-logo: ${shop.id} ${hasLogo ? 'logo da loja' : 'icone do app'}`,
    );
  }

  if (fs.existsSync(BUILD_WEB)) {
    fs.writeFileSync(SHOPS_JSON, JSON.stringify(written), 'utf8');
  }
  console.log(`SHOPS_JSON=${written.length}`);
  return written;
}

if (require.main === module) {
  main().catch((e) => {
    console.error(e);
    process.exit(1);
  });
}

module.exports = { main, APP_LOGO, SHOPS_JSON };
