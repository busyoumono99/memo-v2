define(['backbone', 'models/note'], function(Backbone, Note) {
  'use strict';
  var Notes;
  Notes = Backbone.Collection.extend({
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
  return Notes;
});
