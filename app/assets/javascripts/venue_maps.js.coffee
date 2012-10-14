class Codebnb.VenueMaps
  markers: []

  constructor: (@map) ->
    new google.maps.event.addListener @map, "center_changed", =>
      @find_near @map.center.Xa, @map.center.Ya, 20

  find_near: (lat, long, rad) ->
    @clear_markers()
    $.get '/venues/near', {lat: lat, long: long, rad: rad}, (data) =>
        $.each JSON.parse(data), (index, venue) =>
          @add_mark venue

  add_mark: (venue) ->
   marker = new google.maps.Marker(
        animation: 'bounce'
        map: @map
        position: new google.maps.LatLng(venue.latitude, venue.longitude)
        title: venue.title
        clickable: true
    )
    new google.maps.event.addListener marker, "click", =>
      @show_popup(venue)
    @markers.push marker

  show_popup: (venue) ->
    $(".modal-body p").html "#{venue.label} </br> #{venue.description} </br> #{venue.latitude} </br> #{venue.longitude} "
    $('#venue-info').modal
      backdrop: 'true'
      show: 'true'



  clear_markers: ->
    $.each @markers, ->
        this.setMap null
    @markers = []
