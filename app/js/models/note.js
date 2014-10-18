define(['backbone', 'backbone-relational-amd'], function(Backbone) {
  'use strict';
  var Note;
  Note = Backbone.RelationalModel.extend({
    defaults: {
      name: '',
      is_default: 0,
      is_active: 0
    },
    url: function() {
      return '../../data.memo/notes';
    }
  });
  return Note.setup();
});
