define(['underscore', 'marionette', 'templates', 'models/note', 'collections/notes', 'collections/tags', 'views/SideNotesView'], function(_, Marionette, templates, Note, Notes, Tags, SideNotesView) {
  'use strict';
  return Marionette.LayoutView.extend({
    className: 'app-layout',
    template: _.template(templates.applayout),
    regions: {
      note_list: '#note-list',
      tag_list: '#tag-list',
      content: '#page-wrapper'
    },
    initialize: function(options) {
      this.notes = Notes.getInstance();
      this.listenTo(this.notes, 'sync', this.updateNoteList);
    },
    onRender: function() {
      console.log('onRender()');
    },
    onShow: function() {
      console.log('onShow()');
    },
    updateNoteList: function() {
      var all, cloneNotes, notes_view;
      all = new Note({
        name: 'All',
        is_default: 0,
        is_active: 1
      });
      cloneNotes = this.notes.clone();
      cloneNotes.unshift(all);
      notes_view = new SideNotesView({
        collection: cloneNotes
      });
      this.note_list.show(notes_view);
    }
  });
});
