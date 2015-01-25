# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_feedback').on('ajax:success', (e, data, status, xhr) ->
    $('#new_feedback')[0].reset()
    $('#new_feedback').fadeOut(700, () ->
      $('#feedback-errors').html xhr.responseJSON.text
      ga('send', 'event', 'feedback', 'send')
    )
  ).on 'ajax:error', (e, xhr, status, error) ->
    html_content = ''
    $.each(xhr.responseJSON, (index, value) ->
      html_content += '<p>' + value + '</p>'
    )
    $('#feedback-errors').html html_content
  
  lastScrollTop = 0
  delta = 154
  $(window).scroll((e) ->
    t = $(this).scrollTop()
    if (Math.abs(lastScrollTop - t) <= delta)
      return
    if t > lastScrollTop then $( 'body > header' ).queue(() ->
        $(this).addClass( 'min stick' )
        $(this).dequeue()
    )
    # else $( 'body > header' ).queue(() ->
    #    $(this).removeClass( 'min stick' )
    #    $(this).dequeue()
    #)
    console.log( lastScrollTop, t)
    lastScrollTop = t
    t <= 154 && $( 'body > header' ).removeClass( 'min stick' )

    #$('section').each(() ->
    #  if $(this).offset().top < window.pageYOffset + 1 && $(this).offset().top + $(this).height() > window.pageYOffset + 1
    #    window.location.hash = $(this).attr('id')
    #)
  )

  $( '.no-touch  a[href^="#"]' ).on( 'click', (e) ->
    e.preventDefault()
    $( 'body' ).stop().scrollTo( $(this).attr( 'href' ), 800 )
  )