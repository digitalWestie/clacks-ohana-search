$(document).ready(function(){
  var map = L.map('mapResults').setView([51.505, -0.09], 13);

  // Fixing the height of panels on the Search Page
  if ($(window).width() > 960) {
    var windowHeight = $(window).height();
    var minusFooterHeader = ($('.navbar-fixed-top').outerHeight() + $('footer').outerHeight());
    $('#resultsPage').css({height: windowHeight - minusFooterHeader});
  }

  if ($(window).width() < 768) {
    var windowHeight = $(window).height();
    var minusHeader = $('.navbar-fixed-top').outerHeight();
    $('#resultsPage').css({height: windowHeight - minusHeader});
  }

  $("#yourBudget").slider({});
  $("#childrenAge").slider({});
});