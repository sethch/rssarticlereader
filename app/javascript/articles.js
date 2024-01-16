function updateReadStatus(articleId, checked) {
    const checkbox = document.getElementById('readStatusCheckbox');

    Rails.ajax({
        url: `/articles/${articleId}/update_read_status`,
        type: 'PATCH',
        data: JSON.stringify({ read_status: checked }),
        contentType: 'application/json',
        // success: data => console.log(data),
        // error: error => console.error(error)
    });
}

/**
 * The following 3 functions are responsible for setting the url param showReadArticles
 * This url param determines whether to filter read articles
 */
function toggleReadArticlesSwitch() {
    var showReadArticlesParam = getParameterByName('showReadArticles');
    var showReadArticlesValue = showReadArticlesParam === 'true' ? 'false' : 'true';

    // Modify the URL with the updated parameter value
    var currentUrl = window.location.href;
    var updatedUrl = updateQueryStringParameter(currentUrl, 'showReadArticles', showReadArticlesValue);

    // Redirect to the updated URL
    window.location.href = updatedUrl;
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
    var separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
        return uri.replace(re, '$1' + key + "=" + value + '$2');
    } else {
        return uri + separator + key + "=" + value;
    }
}

window.updateReadStatus = updateReadStatus;
window.toggleReadArticlesSwitch = toggleReadArticlesSwitch;