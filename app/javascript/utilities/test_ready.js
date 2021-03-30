document.addEventListener('turbolinks:load', function() {
  $(".ready_checkbox").on('change', function(){
    $.ajax({
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name=csrf-token]').attr('content'))
      },
      url: `/admin/tests/${this.value}/update_inline`,
      type: 'PATCH',
      data: { "test": {"ready": this.checked } }
    });
  });
});
