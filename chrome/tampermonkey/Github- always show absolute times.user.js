// ==UserScript==
// @name         Github: always show absolute times
// @match        https://github.com/*
// ==/UserScript==

(function() {
  function loop() {
    document.querySelectorAll("relative-time").forEach(function(el) {
      var parent = el.parentNode;
      var timestamp = el.title;
      var span = document.createElement("span");
      span.innerHTML = timestamp;
      parent.removeChild(el);
      parent.appendChild(span);
    });
    setTimeout(loop, 1000);
  }
  loop();
})();