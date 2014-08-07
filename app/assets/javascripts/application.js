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
//= require ckeditor/init
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap.min
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function () {  
  
  $(function() {
    var availableTags = $("#auto_holder").val().split(",");
    $("#search").autocomplete({
      source: availableTags
    });
  });

  $(function() {
    $("#active_button").on("click", function() {
      var id = $('#active_button').val();
      var table_name = $('#active_button').attr("table");
      if($("#active_button").text() == "Deactivate") {
        $('#active_button').text("Activate")
        deactivate(id, table_name) 
      }
      else {
        $("#active_button").text("Deactivate")
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
      if($("#"+button_id).text() == "Deactivate") {
        $("#"+button_id).text("Activate")
        deactivate(id, table_name) 
      }
      else {
        $("#"+button_id).text("Deactivate")
        activate(id, table_name);
      }
    });
  });

  $(function() {
    $(".navigation").mouseover(function() {
      $(".ul_block").show();
    });
    $(".navigation").mouseout(function() {
      $(".ul_block").hide();
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

  