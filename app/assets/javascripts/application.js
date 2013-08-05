// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require_tree .

$(document).ready(function()  {
    var characters = 120;
    $(".counter").append(characters+" left");
    $("textarea").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter").html(remaining+" left");
    if(remaining <= 20)
    {
        $(".counter").css("color","red");
    }
    else
    {
        $(".counter").css("color","black");
    }
    });
});