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
//= require underscore
//= require backbone
//= require moment
//= require jquery_ujs
//= require jquery.ui.all
//= require bring_up
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .
//= require_self

// This code adds a counter to the messages form on the courses show view. It turns the text red as the character limit approaches.
$(document).ready(function()  {

  $.fn.counterField = function() {
    var characters = 120;
    var $counter = $(this).siblings('span');
    var remaining = characters -  $(this).val().length;
    $counter.append(remaining+" left");
    $(this).keyup(function(){
      if($(this).val().length > characters){
        $(this).val($(this).val().substr(0,characters));
      }
      var remaining = characters -  $(this).val().length;
      $counter.html(remaining+" left");
      if(remaining <= 20)
      {
        $counter.css("color","red");
      }
      else
      {
        $counter.css("color","black");
      }
    });
  };

// This code toggles the parent list on the primary teacher dashboard
  $('.showparent').click(function(){
    $('.parent_item').toggle();
  });

  // $('#teacher_school_name').autocomplete({
  //   source: $('#teacher_school_name').data('autocomplete-source')
  // });

  // $('.datepicker').datepicker({
  //   onSelect: function(dateText, inst){
  //     console.log('foo');
  //     //$(this).trigger()
  //     //awesome ajax stuff based on dateText
  //   },
  //   beforeShowDay: function(date){
  //       return [true, 'date-' + date.getDate() ];
  //   }
  // });
});

