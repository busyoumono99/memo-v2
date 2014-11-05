define(['backbone', 'models/tag'], function(Backbone, Tag) {
  'use strict';
  var Tags;
  console.log('run tags');
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
      console.log('in Tags.parse()');
      console.log(response);
      if (response.tags != null) {
        return response.tags;
      }
      return response;
    }
  });
  Tags.instance = null;
  Tags.getInstance = function() {
    var istc;
    if (Tags.instance == null) {
      istc = new this();
      Tags.instance = istc;
      Tags.instance.fetch();
    }
    return Tags.instance;
  };
  return Tags;
});
