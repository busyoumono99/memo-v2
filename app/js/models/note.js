define(['backbone', 'backbone-relational-amd'], function(Backbone) {
  'use strict';
  var Note;
  Note = Backbone.RelationalModel.extend({
    url: function() {
      return '../../data.memo/notes';
    }
  });
  return Note.setup();
});
