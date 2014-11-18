define(['underscore', 'marionette', 'templates', 'models/note', 'collections/notes', 'collections/tags', 'views/SideNotesView', 'views/SideTagsView'], function(_, Marionette, templates, Note, Notes, Tags, SideNotesView, SideTagsView) {
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
      this.tags = Tags.getInstance();
      this.listenTo(this.tags, 'sync', this.updateTagList);
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
    },
    updateTagList: function() {
      var tags_view;
      tags_view = new SideTagsView({
        collection: this.tags
      });
      this.tag_list.show(tags_view);
    }
  });
});
