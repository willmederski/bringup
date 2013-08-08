window.BringUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.messages = new BringUp.Collections.Messages;
    this.messagesView = new BringUp.Views.MessagesIndex({ collection: this.messages });

    this.messages.fetch({
      success: function(){
        // Render the center messages column.
        BringUp.messagesView.render();
      }
    });
  }
};

$(document).ready(function() {
  BringUp.initialize();
});
