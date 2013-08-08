BringUp.Collections.Messages = Backbone.Collection.extend({
  model: BringUp.Models.Message,

  url: function() {
    return $('#messages-url').data('url');
  }
});
