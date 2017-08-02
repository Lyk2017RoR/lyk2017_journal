$(document).ready(function (){
  $('#user_terms_of_use').click(function(){
    open_terms_modal();
  });
  $('label[for="user_terms_of_use"]').click(function () {
    open_terms_modal()
  });
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
  $('#user_terms_of_use').prop('checked', status);
  $('#user_terms_of_use').prop('disabled', !status);
}