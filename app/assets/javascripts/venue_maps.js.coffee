class Codebnb.VenueMaps
  markers: []

  constructor: (@map) ->
    new google.maps.event.addListener @map, "center_changed", =>
      @find_near @map.center.Xa, @map.center.Ya, 20

  find_near: (lat, long, rad) ->
    @clear_markers()
    $.get '/venues/near', {lat: lat, long: long, rad: rad}, (data) =>
        $.each JSON.parse(data), (index, venue) =>
          @add_mark venue.label, venue.latitude, venue.longitude

  add_mark: (title, lat, long) ->
    @markers.push new google.maps.Marker(
        animation: 'bounce'
        map: @map
        position: new google.maps.LatLng(lat, long)
        title: title
        clickable: true
    )

  clear_markers: ->
    $.each @markers, ->
        this.setMap null
    @markers = []
