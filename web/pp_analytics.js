(function () {
  'use strict';

  var MEASUREMENT_ID = 'G-N4BVXV4HBC';
  var CONSENT_KEY = 'pp_cookie_consent';
  var loaded = false;

  function readConsent() {
    try {
      return window.localStorage.getItem(CONSENT_KEY);
    } catch (e) {
      return null;
    }
  }

  function loadAnalyticsIfConsented() {
    if (loaded) return;
    if (readConsent() !== 'granted') return;
    loaded = true;

    window.dataLayer = window.dataLayer || [];
    function gtag() {
      window.dataLayer.push(arguments);
    }
    window.gtag = gtag;

    var script = document.createElement('script');
    script.async = true;
    script.src =
      'https://www.googletagmanager.com/gtag/js?id=' + encodeURIComponent(MEASUREMENT_ID);
    script.onload = function () {
      gtag('js', new Date());
      gtag('config', MEASUREMENT_ID, { anonymize_ip: true });
    };
    document.head.appendChild(script);
  }

  function scheduleAnalyticsCheck() {
    var run = function () {
      loadAnalyticsIfConsented();
    };
    if (typeof window.requestIdleCallback === 'function') {
      window.requestIdleCallback(run, { timeout: 5000 });
    } else {
      window.setTimeout(run, 2500);
    }
  }

  window.ppLoadAnalyticsIfConsented = loadAnalyticsIfConsented;

  window.addEventListener('flutter-first-frame', scheduleAnalyticsCheck, { once: true });
  window.setTimeout(scheduleAnalyticsCheck, 9000);
})();
