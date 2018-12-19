$(function(){
  if($(".js-comment_status")[0]){
    $(document).on('change', '.js-comment_status', function(){
      $(this).closest('form').submit();
    });
  }
});
$(function() {
  $('input').change(function() {
    var val = $(this).val();
    $('p').text(val);
  });
});