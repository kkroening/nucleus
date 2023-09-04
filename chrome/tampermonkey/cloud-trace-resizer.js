// ==UserScript==
// @name         Cloud Trace resizer
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  Makes the trace view in Cloud Trace actually usable by making it a reasonable size.
// @author       Karl Kroening
// @match        https://console.cloud.google.com/traces/list?*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=google.com
// @require  https://gist.github.com/raw/2625891/waitForKeyElements.js
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    const TAG_NAME = 'ac-gantt-chart';
    const HEIGHT = '100vh';

    function loop() {
        let elements = document.getElementsByTagName(TAG_NAME);
        if (!elements.length) {
            console.log(`No ${TAG_NAME} elements found`);
        } else {
            for (let element of elements) {
                if (element.style.height != HEIGHT) {
                    console.log('patching', element);
                    element.style.height = HEIGHT;
                }
            }
        }
        setTimeout(loop, 1000);
    }
    loop()
})();
