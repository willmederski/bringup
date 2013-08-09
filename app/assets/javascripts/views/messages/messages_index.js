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

  handleCalendarChange: function(selectDate) {
    var selected = selectDate;
    var date = new Date();
    var t = selected.getDay();
    if (t === 0){
      date.setDate(selected.getDate() + 1)
    }
    else {
      date.setDate(selected.getDate() + 1 - t)
    };
    this.setStartDate(date);
    this.collection.trigger('changeDate');
  },

  moveToPreviousWeek: function() {
    
    date = this.weekdays[0];
    date.setDate(date.getDate() - 7);
    this.setStartDate(date);
    this.collection.trigger('changeDate');
  },

  moveToNextWeek: function() {
    date = this.weekdays[0];
    date.setDate(date.getDate() + 7);
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
