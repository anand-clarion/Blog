$(document).on('ready page:load', function () {
  $(function() {
    $("#ckeditor_span").click(function () {
      if($("#ckeditor_span").text() == "Show Editor") {
        $('#ckeditor_span').text("Hide Editor");
        $("#ckeditor").show();
        $("#normal_field").hide();
        $(".normal_text_area").attr('disabled', 'disabled');
      }
      else {
        $('#ckeditor_span').text("Show Editor")
        $("#ckeditor").hide();
        $("#normal_field").show();
        $(".normal_text_area").attr('disabled', false);
      }
    });
  });
});