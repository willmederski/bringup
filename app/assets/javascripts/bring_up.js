window.BringUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Events: _.extend({}, Backbone.Events),
  initialize: function() {
    this.messages = new BringUp.Collections.Messages;
    this.messagesView = new BringUp.Views.MessagesIndex({ collection: this.messages });
    this.messagesMonthView = new BringUp.Views.MessagesMonth( {collection: this.messages });

    this.messages.fetch({
      success: function(){
        // Render the center messages column.
        BringUp.messagesView.render();
        BringUp.messagesMonthView.render();
      }
    });
  }
};

$(document).ready(function() {
  BringUp.initialize();
});
