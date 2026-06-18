#!/usr/bin/env node
/**
 * Gera HTML estático (preto/branco) para políticas PerfectGest-Contabil I.
 * Modelo Clinica III / PerfectGest I — independente da vitrine Flutter.
 */
const fs = require('node:fs');
const path = require('node:path');

const DATA = require('./contabil-i-legal-data.cjs');

const ORIGIN = 'https://perfectgestdev.com';

function esc(s) {
  return String(s)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;');
}

function bodyHtml(text) {
  return esc(text).replace(/\n/g, '<br>\n');
}

function sectionsHtml(sections) {
  return sections
    .map(
      (s) =>
        `<section class="block"><h2>${esc(s.heading)}</h2><div class="body">${bodyHtml(s.body)}</div></section>`,
    )
    .join('\n');
}

function langBlock(lang, page, visible) {
  const title = page.titles[lang];
  const header = DATA.header[lang];
  const updated = DATA.lastUpdated[lang];
  return `<div class="lang-panel" data-lang="${lang}"${visible ? '' : ' hidden'}>
  <h1 class="page-title">${esc(title)}</h1>
  <p class="updated">${esc(updated)}</p>
  <div class="legal-header">${bodyHtml(header)}</div>
  ${sectionsHtml(page.sections[lang])}
</div>`;
}

function footerLinks(pageId, lang) {
  const L = DATA.labels[lang];
  const S = DATA.pageSlugs;
  const items = [
    { id: 'privacy', label: L.privacy, href: `/${S.privacy}` },
    { id: 'terms', label: L.terms, href: `/${S.terms}` },
    { id: 'deletion', label: L.deletion, href: `/${S.deletion}` },
    { id: 'faq', label: L.faq, href: `/${S.faq}` },
  ];
  return items
    .map((item) => {
      if (item.id === pageId) {
        return `<span class="footer-current">${esc(item.label)}</span>`;
      }
      return `<a href="${item.href}">${esc(item.label)}</a>`;
    })
    .join('<span class="sep"> · </span>');
}

function buildPage(pageId) {
  const page = DATA.pages[pageId];
  const canonical = `${ORIGIN}/${page.slug}`;
  const defaultLang = 'pt';

  const langPanels = ['pt', 'en', 'es']
    .map((lang) => langBlock(lang, page, lang === defaultLang))
    .join('\n');

  const footerPt = footerLinks(pageId, 'pt');
  const footerEn = footerLinks(pageId, 'en');
  const footerEs = footerLinks(pageId, 'es');

  return `<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="color-scheme" content="light only">
  <meta name="robots" content="index, follow">
  <title>${esc(page.titles.pt)}</title>
  <meta name="description" content="${esc(page.titles.pt)}">
  <link rel="canonical" href="${canonical}">
  <style>
    :root { color-scheme: light only; }
    * { box-sizing: border-box; }
    html, body {
      margin: 0; padding: 0;
      background: #fff; color: #000;
      font-family: "Segoe UI", "Segoe UI Web", "Helvetica Neue", Arial, sans-serif;
      font-size: 14px; line-height: 1.6;
    }
    .top {
      display: flex; align-items: center; justify-content: space-between;
      padding: 12px 24px; border-bottom: 1px solid #e1e1e1;
      background: #fff;
    }
    .top-title { font-size: 15px; font-weight: 600; color: #000; max-width: 70%; }
    .lang-nav button {
      background: #fff; border: 1px solid #ccc; color: #000;
      padding: 4px 10px; margin-left: 4px; cursor: pointer; font-size: 13px;
    }
    .lang-nav button.active { border-color: #0067b8; color: #0067b8; font-weight: 600; }
    main { max-width: 800px; margin: 0 auto; padding: 24px 24px 40px; }
    .page-title { font-size: 26px; font-weight: 600; margin: 0 0 8px; color: #000; }
    .updated { color: #444; font-size: 13px; margin: 0 0 20px; }
    .legal-header {
      background: #f3f3f3; border: 1px solid #e1e1e1;
      padding: 16px; margin-bottom: 28px; color: #000;
    }
    .block { margin-bottom: 24px; }
    .block h2 { font-size: 16px; font-weight: 600; margin: 0 0 8px; color: #000; }
    .block .body { color: #000; }
    footer {
      border-top: 1px solid #e1e1e1; padding-top: 16px; margin-top: 32px;
      text-align: center; font-size: 13px; line-height: 1.8;
    }
    footer a { color: #0067b8; text-decoration: underline; }
    footer .footer-current { color: #000; font-weight: 600; }
    footer .sep { color: #666; }
    [hidden] { display: none !important; }
  </style>
</head>
<body>
  <header class="top">
    <div class="top-title" id="top-title">${esc(page.titles.pt)}</div>
    <nav class="lang-nav" aria-label="Idioma">
      <button type="button" data-set-lang="pt" class="active">PT</button>
      <button type="button" data-set-lang="en">EN</button>
      <button type="button" data-set-lang="es">ES</button>
    </nav>
  </header>
  <main>
    ${langPanels}
    <footer>
      <div data-lang="pt" class="footer-lang">${footerPt}</div>
      <div data-lang="en" class="footer-lang" hidden>${footerEn}</div>
      <div data-lang="es" class="footer-lang" hidden>${footerEs}</div>
    </footer>
  </main>
  <script>
    (function () {
      var titles = ${JSON.stringify(page.titles)};
      function setLang(lang) {
        document.querySelectorAll('.lang-panel').forEach(function (el) {
          el.hidden = el.getAttribute('data-lang') !== lang;
        });
        document.querySelectorAll('.footer-lang').forEach(function (el) {
          el.hidden = el.getAttribute('data-lang') !== lang;
        });
        document.querySelectorAll('[data-set-lang]').forEach(function (btn) {
          btn.classList.toggle('active', btn.getAttribute('data-set-lang') === lang);
        });
        var t = titles[lang] || titles.pt;
        document.title = t;
        document.getElementById('top-title').textContent = t;
        document.documentElement.lang = lang === 'pt' ? 'pt-BR' : lang;
        try { localStorage.setItem('pp_contabil_i_lang', lang); } catch (e) {}
      }
      document.querySelectorAll('[data-set-lang]').forEach(function (btn) {
        btn.addEventListener('click', function () {
          setLang(btn.getAttribute('data-set-lang'));
        });
      });
      var saved = null;
      try { saved = localStorage.getItem('pp_contabil_i_lang'); } catch (e) {}
      if (saved === 'en' || saved === 'es' || saved === 'pt') setLang(saved);
    })();
  </script>
</body>
</html>`;
}

function writeAll(buildWeb) {
  const slugs = [];
  for (const pageId of Object.keys(DATA.pages)) {
    const slug = DATA.pages[pageId].slug;
    slugs.push(slug);
    const html = buildPage(pageId);
    fs.writeFileSync(path.join(buildWeb, `${slug}.html`), html, 'utf8');
  }
  return slugs;
}

module.exports = { writeAll, buildPage };

if (require.main === module) {
  const out = process.argv[2] || path.join(__dirname, '..', 'build', 'web');
  const slugs = writeAll(out);
  console.log(`contabil-i-static-html: ${slugs.length} paginas -> ${out}`);
}
