$(document).ready(function () {
  filterSearchInput();
});

function filterSearchInput () {
  // When user types something
  $("#search-input").keyup(function () {
    var input = $("#search-input").val().toLowerCase()
    // Find search results
    renderSearchResults(input);
  });
};

function renderSearchResults (searchInput) {
  // Compare all the link with Search Input
  $(".link").each(function (index, link) {
    var linkContent = $(link).find('.title, .url').text().toLowerCase()
    // Compare content with search terms
    var results = linkContent.indexOf(searchInput) !== -1;
    // hide or show accordingly
    $(link).toggle(results)
  });
};