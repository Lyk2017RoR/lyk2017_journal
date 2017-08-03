open_terms_modal = ->
  set_terms_status false
  $('#terms').modal 'show'
  $('#terms button.ok').click (event) ->
    set_terms_status true
    return
  $('#terms button.deny').click (event) ->
    set_terms_status false
    return
  return

set_terms_status = (status) ->
  inputs = $('input[name="user[terms_of_use]"]')
  $(inputs).each ->
    $(this).prop 'checked', status
    return
  return

$(document).on "turbolinks:load", ->
  $('#user_terms_of_use').click ->
    open_terms_modal()
    return
  $('label[for="user_terms_of_use"]').click ->
    open_terms_modal()
    return
  $('#user_profile_tab > .item').tab()
  return