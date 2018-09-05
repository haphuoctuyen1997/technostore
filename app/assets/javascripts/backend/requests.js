$(".delete").on("click",function(){
  var id = $(this).attr('data-id');
  $.ajax({
    method: 'DELETE',
    headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
    url: "/backend/requests/" + $(this).attr("data-id"),
    dataType: 'json',
    success: function (data) {
      $('.verify').removeClass('hidden');
      $('.delete').addClass('hidden');
      $('#request-'+id).html(data["request"]["status"]);
    }
  });
});
$(".verify").on("click",function(){
  var id = $(this).attr('data-id');
  swal({
    title: I18n.t('backend.requests.request.confirm'),
    text: I18n.t('backend.requests.request.text'),
    type: I18n.t('backend.requests.request.type'),
    showCancelButton: true,
    confirmButtonColor: I18n.t('backend.requests.request.confirmButtonColor'),
    cancelButtonColor: I18n.t('backend.requests.request.cancelButtonColor'),
    confirmButtonText: I18n.t('backend.requests.request.confirmButtonText')
  }).then(function(isConfirm) {
    if (isConfirm.value == true) {
      $.ajax({
        method: 'PATCH',
        headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
        url: "/backend/requests/" + id,
        dataType: 'json',
        success: function (data) {
          $('.verify').addClass('hidden');
          $('.delete').removeClass('hidden');
          $('#request-'+id).html(data["request"]["status"]);
          swal(
          I18n.t('backend.requests.request.accept'),
          I18n.t('backend.requests.request.accept_been'),
          I18n.t('backend.requests.request.success')
        );
      }
    });
    }
  });
});
