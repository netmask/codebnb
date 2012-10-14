@Codebnb ||= {}

class Codebnb.google_maps

  constructor: ->

  initMap: ()->
    @mapOptions =
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById('venues_map'), @mapOptions)
    venue_maps = new Codebnb.VenueMaps map
    # Try HTML5 geolocation
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition ((position) ->
        pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
        @infowindow = new google.maps.Marker(
          animation: 'bounce'
          map: map
          position: pos
          title: "You are here!"
          clickable: true
        )
        map.setCenter pos

        $('#venue_latitude').val(position.coords.latitude)
        $('#venue_longitude').val(position.coords.longitude)

      ), ->
        @handleNoGeolocation true
    else
      # Browser doesn't support Geolocation
      @handleNoGeolocation false


    $('#find_location').live 'click', (e) ->
      e.preventDefault()
      geo = new google.maps.Geocoder()
      geo.geocode
        address: "#{$('#address').val()}, #{$('#city').val()}, #{$('#state').val()}, #{$('#zip-code').val()}, USA"
      , (locResult) ->
        if locResult.length > 0
          pos = new google.maps.LatLng(locResult[0].geometry.location.lat(), locResult[0].geometry.location.lng())
          @infowindow.setOptions(
            map: map
            position: pos
            title: "You are here!"
          )
          map.setCenter pos
          $('#venue_latitude').val locResult[0].geometry.location.lat()
          $('#venue_longitude').val locResult[0].geometry.location.lng()
        else
          $('.alert').toggle()



  handleNoGeolocation: (errorFlag) ->
    if errorFlag
      content = "Error: The Geolocation service failed."
    else
      content = "Error: Your browser doesn't support geolocation."
    @options =
      map: map
      position: new google.maps.LatLng(60, 105)
      content: content

    infowindow = new google.maps.InfoWindow(options)
    map.setCenter @options.position

  loadMap: (lat, lng) ->
    @mapOptions =
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById('venues_map'), @mapOptions)

    pos = new google.maps.LatLng(lat, lng)
    @infowindow = new google.maps.Marker(
      animation: 'bounce'
      map: map
      position: pos
      title: "You are here!"
      clickable: true
    )
    map.setCenter pos



# map = undefined
# google.maps.event.addDomListener window, "load", initialize
