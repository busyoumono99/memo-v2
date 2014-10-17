define(['backbone', 'models/tag'], function(Backbone, Tag) {
  'use strict';
  var Tags;
  Tags = Backbone.Collection.extend({
    url: function() {
      var created, id;
      if (this.get("tag")) {
        id = this.get("tag").id;
      }
      created = id ? "/" + id : '';
      return '../../data.memo/tags' + created;
    },
    model: Tag,
    parse: function(response) {
      return response;
    }
  });
  return Tags;
});
