define(['backbone', 'models/tag'], function(Backbone, Tag) {
  'use strict';
  console.log('run tags');
  return Backbone.Collection.extend({
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
      console.log('in Tags.parse()');
      console.log(response);
      if (response.tags != null) {
        return response.tags;
      }
      return response;
    }
  });
});
