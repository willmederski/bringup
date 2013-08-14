BringUp.Views.MessagesIndex = Backbone.View.extend({
  template: JST['messages/index'],

  events: {
    "click #lastweek": "moveToPreviousWeek",
    "click #nextweek": "moveToNextWeek",
    // "click .ui-state-default": "changeWeek"
  },

  initialize: function(){
    this.collection.on('reset', this.render, this);
    this.collection.on('changeDate', this.render, this);
    BringUp.Events.on('changeDateInCalendar', this.handleCalendarChange, this);

    this.setStartDate(new Date($('#this-weeks-monday').data('date')));
  },

  setStartDate: function(startDate) {
    var sunday = startDate;
    var mon = new Date(sunday);
    mon.setDate(sunday.getDate() + 1);
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

  handleCalendarChange: function(selectDate) {
    console.log('Rercived date', selectDate)
    var selected = selectDate; // Fri Oct 4
    var date = new Date();
    var t = selected.getDay(); // 5
    var calendarDate = selected;
    date.setMonth(calendarDate.getMonth());
    date.setYear(calendarDate.getFullYear()); // Fri Oct 4 (trying to get Mon Sept 30)
    console.log('day', t);
    console.log('calendarDate', calendarDate.getDate()); 
    if (t === 0){
      date.setDate(calendarDate.getDate());
      console.log("t=0",date);
    }
    else {
      date.setDate(calendarDate.getDate()- t); // (4) + 1 - 5 = 0
      console.log("t!=0",date);
    };
    console.log('Date', date);
    this.setStartDate(date);
    this.collection.trigger('changeDate');
  },

  moveToPreviousWeek: function() {
    
    date = this.weekdays[0];
    date.setDate(date.getDate() - 8);
    this.setStartDate(date);
    this.collection.trigger('changeDate');
  },

  moveToNextWeek: function() {
    date = this.weekdays[0];
    date.setDate(date.getDate() + 6);
    this.setStartDate(date);
    this.collection.trigger('changeDate');
  },

  render: function(){
    console.log('render!')
    $(this.el).html(this.template({ messages: this.collection, weekdays: this.weekdays }));
    $('#messages-list').html(this.el);

    this.delegateEvents();

    // Attach counter events.
    $('#body1').counterField();
    $('#body2').counterField();
    $('#body3').counterField();
    $('#body4').counterField();
    $('#body5').counterField();

    return this;
  }
});
