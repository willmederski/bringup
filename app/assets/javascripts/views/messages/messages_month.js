BringUp.Views.MessagesMonth = Backbone.View.extend({

  events: {
    "click .ui-state-default": "change",
    "click .ui-datepicker": "changeMonth"
  },

  initialize: function(){
    this.collection.on('reset', this.render, this);
    
  },

  $calendar: function() {
    return $('.datepicker');
  },

  changeDate: function() {
    // console.log(this.$calendar().datepicker('getDate'));
    var date = this.$calendar().datepicker('getDate');
    BringUp.Events.trigger('changeDateInCalendar', date);
  },

  changeMonth: function() {
    self = this;
    self.render();
  },

  render: function(){
    console.log('render!!!!');
    var self = this;

    this.datepicker = $('.datepicker').datepicker({
      onSelect: function(dateText, inst){
        self.changeDate(dateText);
      },
      beforeShowDay: function(date){
        var data = self.collection.toJSON();
        console.log(data)
        var x = [];
        var val = [true,"",""];
        // console.log(date.toLocaleDateString('en-US'));
        var match = moment(date).format('M/D/YYYY')
        console.log(match)
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

    return this;
  }
});
