
initMap ->
  map = new google.maps.Map(document.getElementById('map'),
    center: lat: 51.260197, lng: 4.402771,
    zoom: 20,
    mapTypeId: 'satellite'
  )

  // Try HTML5 geolocation.
  if navigator.geolocation
      navigator.geolocation.getCurrentPosition.name
    navigator.geolocation.getCurrentPosition(position ->
      pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      }

      lat1 = position.coords.latitude
      long1 = position.coords.longitude

      $("#latitude").val(position.coords.latitude)
      $("#longitude").val(position.coords.longitude)
      
      infoWindow.setPosition(pos)
      console.log "Location: "+ lat1.toString()+", "+long1.toString() + city.toString()
      infoWindow.setContent('Location found: '+ pos.lat.toString() +','+ pos.lng.toString()+'; ' + 'Time: '+ time.toString())
      map.setCenter(pos)
    , ->
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