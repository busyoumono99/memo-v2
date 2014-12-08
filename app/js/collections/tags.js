define(['backbone', 'models/tag'], function(Backbone, Tag) {
  'use strict';
  var Tags;
  console.log('run tags');
  Tags = Backbone.Collection.extend({
    model: Tag,
    url: '../../data.memo/tags',
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
