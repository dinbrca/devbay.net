var sitePicker = document.getElementById('site-picker');
var activeSite = null;

function hasClass(el, className) {
    return el.classList ? el.classList.contains(className) : new RegExp('\\b'+ className+'\\b').test(el.className);
}

function addClass(el, className) {
    if (el.classList) el.classList.add(className);
	else if (!hasClass(el, className)) el.className += ' ' + className;
}

function removeClass(el, className) {
	if (el.classList) el.classList.remove(className);
	else el.className = el.className.replace(new RegExp('\\b'+ className+'\\b', 'g'), '');
}

function toggleClass(el, className) {
    hasClass(el, className) ? removeClass(el, className) : addClass(el, className);
}

function useSitePicker(sitePicker) {
    sitePicker.addEventListener('change', function (e) {
        showSite(sitePicker.value);
    });
}

function showSite(siteNo) {
    var site = document.querySelector('#site-' + siteNo);
    if (site) {
        if (activeSite) {
            toggleClass(activeSite, 'active');
        }
        activeSite = site;
        toggleClass(site, 'active');
    }
}

if (sitePicker) {
    useSitePicker(sitePicker);
    showSite(sitePicker.value);
}
