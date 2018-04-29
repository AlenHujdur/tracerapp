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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require webcam.min
//= require_tree .
//$(function(){
var lat1;
var long1;
var city;


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 51.260197, lng: 4.402771},
    zoom: 20,
    mapTypeId: 'satellite'
  });

  // Try HTML5 geolocation.
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition.name
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      //testt = pos;
      lat1 = position.coords.latitude;
      long1 = position.coords.longitude;

      var infoWindow = new google.maps.InfoWindow({map:map, maxWidth: 250});
      var latlng = {lat: parseFloat(lat1), lng: parseFloat(long1)};
      var input = document.getElementById('latlng').value;
      var latlngStr = input.split(',', 2);

      var res;
      var geocoder = new google.maps.Geocoder;
      geocoder.geocode({'location': latlng}, function(results, status) {
        if (status === 'OK') {
          if (results[0]) {
            map.setZoom(11);
            var marker = new google.maps.Marker({
              position: latlng,
              map: map
            });
            //infowindow.setContent(results[0].formatted_address);
            //infowindow.open(map, marker);
            res = results[0].formatted_address;
          } else {
            //window.alert('No results found');
          }
        } else {
          window.alert('Geocoder failed due to: ' + status);
        }
      });

      city = position.coords;
      var time = new Date(position.timestamp);
      time1 = time;
      $("#time11").val(time1);
      $("#latitude").val(position.coords.latitude);
      $("#longitude").val(position.coords.longitude);
      $("#res").val(res);
      infoWindow.setPosition(pos);
      console.log("Location: "+ lat1.toString()+", "+long1.toString() + city.toString());
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
function GOOGLEAPI(){

}
//});

var camera = new JpegCamera("#camera");

var snapshot = camera.capture();

snapshot.show(); // Display the snapshot

snapshot.upload({api_url: "/upload_image"}).done(function(response) {
  response_container.innerHTML = response;
  this.discard(); // discard snapshot and show video stream again
}).fail(function(status_code, error_message, response) {
  alert("Upload failed with status " + status_code);
});