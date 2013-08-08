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

        $('#body1').counterField();
        $('#body2').counterField();
        $('#body3').counterField();
        $('#body4').counterField();
        $('#body5').counterField();
      }
    });
  }
};

$(document).ready(function() {
  BringUp.initialize();
});
