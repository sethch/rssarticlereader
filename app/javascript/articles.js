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

window.updateReadStatus = updateReadStatus;