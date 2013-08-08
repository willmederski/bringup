BringUp.Views.MessagesIndex = Backbone.View.extend({
  template: JST['messages/index'],

  initialize: function(){
    this.collection.on('reset', this.render, this);
  },

  render: function(){
    $(this.el).html(this.template({ messages: this.collection }));
    return this;
  }
});
