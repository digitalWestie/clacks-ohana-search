$(document).ready(function(){
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

  var map = L.map('mapResults').setView([56.11, -3.74], 11);

  // add an OpenStreetMap tile layer
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  $("#yourBudget").slider({});
  $("#childrenAge").slider({});
});