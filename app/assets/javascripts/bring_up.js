window.BringUp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.messages = new BringUp.Collections.Messages;
    var view = new BringUp.Views.MessagesIndex({ collection: this.messages });
    this.messages.fetch({
      success: function(){
        $('#messages-list').html(view.render().el);
      }
    });
  }
};

$(document).ready(function() {
  BringUp.initialize();
});
