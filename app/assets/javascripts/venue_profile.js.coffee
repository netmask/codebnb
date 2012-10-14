@Codebnb ||= {}

class Codebnb.venue_profile

  constructor: ->
    $('#different-place').live 'click', () ->
      $('.address').toggle()


