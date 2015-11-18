$(document).on('click', '.change-status', function (event) {
  event.preventDefault();

  var id = $(this).closest('.link').data('link-id')

  changeStatus(id)
    .then(renderUpdatedLink.bind(this));
});

function changeStatus (id) {
  return $.ajax({
    type: 'PUT',
    url: '/links/' + id,
    data: { update_status: true }
  })
};

function renderUpdatedLink (link, button) {
  if (link.read) {
    this.innerHTML = "Mark as Unread"
    this.previousElementSibling.innerHTML = "Read"
    this.closest('p').classList.add("Read");
  } else {
    this.innerHTML = "Mark as Read"
    this.previousElementSibling.innerHTML = "Unread"
    this.closest('p').classList.remove("Read");
  }
};