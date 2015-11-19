$(document).ready(function () {
  sortAlphabetically();
});

function sortAlphabetically () {
  $('.alphabetical-filter').change(function () {
    var links = $('#links p')
    if (this.selectedIndex == 1) {
      // Sort 'A-Z'
      var azLinks = links.sort(function (a, b) {
        return $(a).find('.title').text() > $(b).find('.title').text();
      });
      $('#links').html(azLinks);
    } else if (this.selectedIndex == 2) {
      // Sort 'Z-A'
      var zaLinks = links.sort(function (a, b) {
        return $(a).find('.title').text() < $(b).find('.title').text();
      });
      $('#links').html(zaLinks);
    };
  });
};

// Source:
//   http://stackoverflow.com/questions/1134976/how-may-i-sort-a-list-alphabetically-using-jquery
//   http://jsfiddle.net/hibbard_eu/C2heg/