define(['backbone', 'models/note'], function(Backbone, Note) {
  'use strict';
  console.log('run notes');
  return Backbone.Collection.extend({
    model: Note,
    url: '../../data.memo/notes',
    parse: function(response) {
      console.log('in Notes.parse()');
      console.log(response);
      if (response.notes != null) {
        return response.notes;
      }
      return response;
    }
  });
});
