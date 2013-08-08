BringUp.Views.MessagesIndex = Backbone.View.extend({
  template: JST['messages/index'],

  initialize: function(){
    this.collection.on('reset', this.render, this);

    var mon = new Date($('#this-weeks-monday').data('date'));
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

  render: function(){
    $(this.el).html(this.template({ messages: this.collection, weekdays: this.weekdays }));
    return this;
  }
});
