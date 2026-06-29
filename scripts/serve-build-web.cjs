#!/usr/bin/env node
const fs = require('node:fs');
const path = require('node:path');
const express = require('express');
const { allLegalSlugs } = require('./legal-routes.cjs');

const app = express();
const port = Number(process.env.PORT || 8100);
const buildWebPath = path.resolve(__dirname, '..', 'build', 'web');

app.disable('etag');

app.use((req, res, next) => {
  res.setHeader('Cache-Control', 'no-store, no-cache, must-revalidate, max-age=0');
  res.setHeader('Pragma', 'no-cache');
  res.setHeader('Expires', '0');
  res.setHeader('Content-Security-Policy', "frame-ancestors 'none'");
  res.setHeader('X-Frame-Options', 'DENY');
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  next();
});

/** Espelha rewrites Render: /contabil-i-faq → contabil-i-faq.html */
app.use((req, res, next) => {
  const raw = req.path.replace(/\/+$/, '') || '/';
  if (raw === '/' || raw.includes('.')) return next();
  const slug = raw.slice(1);
  if (!allLegalSlugs().includes(slug)) return next();
  const htmlFile = path.join(buildWebPath, `${slug}.html`);
  if (fs.existsSync(htmlFile)) {
    return res.sendFile(htmlFile);
  }
  return next();
});

app.use(express.static(buildWebPath, { index: 'index.html' }));

app.use((_req, res) => {
  res.sendFile(path.join(buildWebPath, 'index.html'));
});

app.listen(port, () => {
  console.log(`Web build local em http://localhost:${port}`);
  console.log(`Servindo pasta: ${buildWebPath}`);
});
