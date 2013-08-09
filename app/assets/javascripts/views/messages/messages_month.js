BringUp.Views.MessagesMonth = Backbone.View.extend({

  events: {
    "click .ui-state-default": "change",
    "click .ui-datepicker": "changeMonth"
  },

  initialize: function(){
    this.collection.on('reset', this.render, this);
    this.setStartDate(new Date($('#this-weeks-monday').data('date')));
  },

  setStartDate: function(startDate) {
    var mon = startDate;
    var tue = new Date(mon);
    tue.setDate(tue.getDate() + 1);
    var wed = new Date(tue);
    wed.setDate(wed.getDate() + 1);
    var thu = new Date(wed);
    thu.setDate(thu.getDate() + 1);
    var fri = new Date(thu);
    fri.setDate(fri.getDate() + 1);

    this.weekdays = [ mon, tue, wed, thu, fri ];
  },

  $calendar: function() {
    return $('.datepicker');
  },

  changeDate: function() {
    console.log(this.$calendar().datepicker('getDate'));
    var date = this.$calendar().datepicker('getDate');
    BringUp.Events.trigger('changeDateInCalendar', date);
    this.paintDate();
  },

  paintDate: function(){
    // var self = this;

    // data = this.collection.toJSON()
    // var x = [];


    // for(i=0;i<data.length;i++){
    //     x.push(data[i].send_date);
    // };

    // for(i=0;i<data.length;i++){
    //   var mdate = x[i];
    //   var dates = $('.ui-state-default');

    //   for( j=0;j<dates.length;j++) {
    //     var day = dates[j];
    //     if (((parseInt(day.parentElement.dataset.month)+1) + "/" + (day.text) + "/" + (day.parentElement.dataset.year)) === mdate){
    //          console.log(dates.eq(j));
    //          debugger
    //          dates.eq(j).css("background","#8BC9CA");
    //      };
    //   };
    // };
  },

  changeMonth: function() {
    self = this;
    self.render();
  },

  // changeWeek: function() {
  //   date = this.weekdays[0];
  //   date.setDate(date.getDate() + 7);
  //   this.setStartDate(date);
  // },

  render: function(){
    console.log('render!!!!');
    var self = this;

    this.datepicker = $('.datepicker').datepicker({
      onSelect: function(dateText, inst){
        self.changeDate(dateText);
      },
      beforeShowDay: function(date){
        var data = self.collection.toJSON();
        var x = [];
        var val = [true,"",""];
        console.log(date.toLocaleDateString('en-US'));
        var match = date.toLocaleDateString('en-US');
        for(i=0;i<data.length;i++){
            x.push(data[i].send_date);
        };
        for(i=0;i<x.length;i++){
          if (x[i] === match){
            val = [true,"painted",""]
          };
        };

      return val;

      
        // console.log(data);
        // var x = [];


        // for(i=0;i<data.length;i++){
        //     x.push(data[i].send_date);
        // };

        // for(i=0;i<data.length;i++){
        //   var mdate = x[i];
        //   var dates = $('.ui-state-default');

        //   for( j=0;j<dates.length;j++) {
        //     var day = dates[j];
        //     if (((parseInt(day.parentElement.dataset.month)+1) + "/" + (day.text) + "/" + (day.parentElement.dataset.year)) === mdate){
        //          console.log(dates.eq(j));
        //          debugger
        //          dates.eq(j).css("background","#8BC9CA");
        //      };
        //   };
        // };
      }
    });

    
    self.paintDate();
    return this;
  }
});
