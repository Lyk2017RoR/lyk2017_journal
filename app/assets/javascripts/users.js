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
  $('#terms')
  .modal({
    closable: false,
    onDeny: function(){
      set_terms_status(false);
    },
    onApprove: function(){
      set_terms_status(true);
    },
    onClose: function(){
      set_terms_status(false);
    }
  })
  .modal('show');
}

function set_terms_status(status) {
  var inputs = $('input[name="user[terms_of_use]"]');

  $(inputs).each(function(){
    $(this).prop('checked', status);
    $(this).prop('disabled', !status);
  });
}