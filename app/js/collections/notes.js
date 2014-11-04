define(['backbone', 'models/note'], function(Backbone, Note) {
  'use strict';
  var Notes;
  console.log('run notes');
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
  Notes.instance = null;
  Notes.getInstance = function() {
    var istc;
    console.log('Note.getInstance()');
    console.log(Notes.instance);
    if (Notes.instance == null) {
      istc = new this();
      Notes.instance = istc;
      Notes.instance.fetch();
    }
    return Notes.instance;
  };
  return Notes;
});
