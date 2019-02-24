
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

      $("#latitude").val(pos['lat']);
      $("#longitude").val(pos['lng']);
      
      console.log("Location: "+ pos['lat']+", "+pos['lng']);
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