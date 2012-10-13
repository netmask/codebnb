initialize = ->
  mapOptions =
    zoom: 6
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("venues_map"), mapOptions)

  # Try HTML5 geolocation
  if navigator.geolocation
    navigator.geolocation.getCurrentPosition ((position) ->
      pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
      infowindow = new google.maps.InfoWindow(
        map: map
        position: pos
        content: "Location found using HTML5."
      )
      map.setCenter pos
    ), ->
      handleNoGeolocation true

  else

    # Browser doesn't support Geolocation
    handleNoGeolocation false
handleNoGeolocation = (errorFlag) ->
  if errorFlag
    content = "Error: The Geolocation service failed."
  else
    content = "Error: Your browser doesn't support geolocation."
  options =
    map: map
    position: new google.maps.LatLng(60, 105)
    content: content

  infowindow = new google.maps.InfoWindow(options)
  map.setCenter options.position

map = undefined
google.maps.event.addDomListener window, "load", initialize
