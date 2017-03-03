// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 51.260197, lng: 4.402771},
    zoom: 15
  });
  var infoWindow = new google.maps.InfoWindow({map:map, maxWidth: 250});

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition.name
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      var time = new Date(position.timestamp);
      infoWindow.setPosition(pos);
      infoWindow.setContent('Location found: '+ pos.lat.toString() +','+ pos.lng.toString()+'; ' + 'Time: '+ time.toString());
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, infoWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, infoWindow, map.getCenter());
  }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(browserHasGeolocation ?
                        'Error: The Geolocation service failed.' :
                        'Error: Your browser doesn\'t support geolocation.');
}