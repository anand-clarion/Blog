// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('ready page:load', function () {

  $(function() {
    $("#active_button").on("click", function() {
      var id = $('#active_button').val();
      var table_name = $('#active_button').attr("table");
      if ($("#active_button").text() == "deactivate") {
        $('#active_button').text("activate")
        deactivate(id, table_name) 
      }
      else {
        $("#active_button").text("deactivate")
        var id = $('#active_button').val();
        var table_name = $('#active_button').attr("table");
        activate(id, table_name);
      }
    });
  });

  $(function() {
    $(".active_button_class").on("click", function() {
      var button_id = $(this).attr('id'); 
      var id =  $("#"+button_id).val();
      var table_name =  $("#"+button_id).attr("table");
      if ($("#"+button_id).text() == "deactivate") {
        $("#"+button_id).text("activate")
        deactivate(id, table_name) 
      }
      else {
        $("#"+button_id).text("deactivate")
        activate(id, table_name);
      }
    });
  });
});

function deactivate(id, table_name)
{
  $.ajax({
    url: "/deactivate",
    type: "GET",
    data: { "id" : id, "table_name" : table_name }
  });
} 

function activate(id, table_name)
{
  $.ajax({
    url: "/activate",
    type: "GET",
    data: { "id" : id, "table_name" : table_name }
  });
} 

  