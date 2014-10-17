define(['backbone', 'backbone-relational-amd'], function(Backbone) {
  'use strict';
  var Tag;
  Tag = Backbone.RelationalModel.extend({
    parse: function(response) {
      return response;
    },
    url: function() {
      return '../../data.memo/tags';
    }
  });
  return Tag.setup();
});
