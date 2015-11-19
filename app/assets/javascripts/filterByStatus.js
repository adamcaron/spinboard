$(document).ready(function () {
  filterByStatus();
});

function filterByStatus () {
  $('.status-filter').change(function () {
    if (this.selectedIndex == 1) {
      debugger;
      // Filter by
    } else if (this.selectedIndex == 2) {
      // Filter by Unread
    } else {
      // Do not filter
    }
  })
};