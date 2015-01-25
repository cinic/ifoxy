# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_feedback').on('ajax:success', (e, data, status, xhr) ->
    $('#new_feedback')[0].reset()
    $('#new_feedback').fadeOut(700, () ->
      $('#feedback-errors').html xhr.responseJSON.text
    )
  ).on 'ajax:error', (e, xhr, status, error) ->
    html_content = ''
    $.each(xhr.responseJSON, (index, value) ->
      html_content += '<p>' + value + '</p>'
    )
    $('#feedback-errors').html html_content
  