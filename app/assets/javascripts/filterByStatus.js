$(document).ready(function () {
  filterByStatus();
});

function filterByStatus () {
  $('.status-filter').change(function () {
    if (this.selectedIndex == 1) {
      // Filter by 'Read'
      $('.Read').removeClass('hide');
      $('.Unread').addClass('hide');
    } else if (this.selectedIndex == 2) {
      // Filter by 'Unread'
      $('.Read').addClass('hide');
      $('.Unread').removeClass('hide');
    } else {
      // Do not filter
      $('.Read').removeClass('hide');
      $('.Unread').removeClass('hide');
    }
  })
};