// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require bootstrap
//= require turbolinks
//= require_tree .



$(document).ready(function(){

$("#a").hide();
$("#b").hide();
    $("#bug_bug_type").change(function(){
        var value = $(this).val();


        if(value == 'Bug' )
        {
          $("#a").show();
          $("#b").hide();

        console.log("BUg")
       }
        else {
          $("#a").hide();
          $("#b").show();
          console.log("Feature")
        }


      });

   });
