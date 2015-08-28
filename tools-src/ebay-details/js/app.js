var sitePicker = $('#site-picker');
var activeSite = null;

function useSitePicker(sitePicker) {
    sitePicker.on('change', function (e) {
        showSite(sitePicker.val());
    });
}

function showSite(siteNo) {
    var site = $('#site-' + siteNo);
    if (site) {
        if (activeSite) {
            activeSite.toggleClass('active');
        }
        activeSite = site;
        site.toggleClass('active');
    }
}

if (sitePicker.length) {
    useSitePicker(sitePicker);
    showSite(sitePicker.val());
    $('body').delegate('.expand-shipping-service-details', 'click', function (e) {
        var details = $(e.currentTarget).parents('tr').next('.shipping-service-details');

        e.preventDefault();

        if (details.length) {
            details.toggle();
        }
    });
}
