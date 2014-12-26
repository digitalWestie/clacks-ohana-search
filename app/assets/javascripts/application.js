// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require modernizr.custom.43744.js
//= require jquery
//= require jquery_ujs
//= require bootstrap.js
//= require tooltips.js
//= require leaflet.js
//= require leaflet.markercluster.js
//= require mapping.js
//= require_tree ./bootstrap

var search_by_position = function(position) {
  var latitude = position.coords.latitude;
  var longitude = position.coords.longitude;
  var lat_lng = latitude + "," + longitude;
  $('#lat_lng').val(lat_lng);
  $('#lat_lng').parents('form').submit();
};

$(document).ready(function(){
  if (Modernizr.geolocation) {
    $('#near-me').click(function(){
      navigator.geolocation.getCurrentPosition(search_by_position);
    });
  } else {
    $('#near-me').hide();
  }
});