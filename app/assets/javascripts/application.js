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
    var remaining = characters -  $("#body1").val().length;
    $(".counter1").append(remaining+" left");
    $("#body1").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter1").html(remaining+" left");
    if(remaining <= 20)
    {
        $(".counter1").css("color","red");
    }
    else
    {
        $(".counter1").css("color","black");
    }
    });



    var characters = 120;
    var remaining = characters -  $("#body2").val().length;
    $(".counter2").append(remaining+" left");
    $("#body2").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter2").html(remaining+" left");
    if(remaining <= 20)
    {
        $(".counter2").css("color","red");
    }
    else
    {
        $(".counter2").css("color","black");
    }
    });



    var characters = 120;
    var remaining = characters -  $("#body3").val().length;
    $(".counter3").append(remaining+" left");
    $("#body3").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter3").html(remaining+" left");
    if(remaining <= 20)
    {
        $(".counter3").css("color","red");
    }
    else
    {
        $(".counter3").css("color","black");
    }
    });



    var characters = 120;
    var remaining = characters -  $("#body4").val().length;
    $(".counter4").append(remaining+" left");
    $("#body4").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter4").html(remaining+" left");
    if(remaining <= 20)
    {
        $(".counter4").css("color","red");
    }
    else
    {
        $(".counter4").css("color","black");
    }
    });



    var characters = 120;
    var remaining = characters -  $("#body5").val().length;
    $(".counter5").append(remaining+" left");
    $("#body5").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
        }
    var remaining = characters -  $(this).val().length;
    $(".counter5").html(remaining+" left");
        if(remaining <= 20)
        {
            $(".counter5").css("color","red");
        }
        else
        {
            $(".counter5").css("color","black");
        }
    });


    $(function() {
      $('.datepicker').datepicker();
    });


 
});