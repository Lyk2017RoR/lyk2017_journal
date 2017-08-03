$(document).ready(function (){

  $('#user_terms_of_use').click(function(){
    open_terms_modal();
  });
  $('label[for="user_terms_of_use"]').click(function () {
    open_terms_modal()
  });

  $('#user_profile_tab > .item').tab();
});

function open_terms_modal() {
  set_terms_status(false);
  $('#terms').modal('show');

  $('#terms button.ok').click(function(event){
    set_terms_status(true);
  });

  $('#terms button.deny').click(function (event) {
    set_terms_status(false);
  });
}

function set_terms_status(status) {
  var inputs = $('input[name="user[terms_of_use]"]');

  $(inputs).each( function() {
    $(this).prop('checked', status);
  });
}