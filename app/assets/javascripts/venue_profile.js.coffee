@Codebnb ||= {}

class Codebnb.venue_profile

  constructor: ->
    console.log 'aaa'
    $('#different-place').live 'click', () ->
      $('.address').toggle()


