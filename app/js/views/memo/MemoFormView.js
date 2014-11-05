define(['underscore', 'marionette', 'app', 'vent', 'templates', 'collections/notes', 'collections/tags', 'views/memo/MemoFormNotesView', 'views/memo/MemoFormTagsView'], function(_, Marionette, app, vent, templates, Notes, Tags, MemoFormNotesView, MemoFormTagsView) {
  'use strict';
  console.log('read MemoFormView');
  return Marionette.LayoutView.extend({
    className: 'row',
    template: _.template(templates.memo.form),
    regions: {
      note_container: '#note-select-container',
      tag_container: '#tag-btn-container'
    },
    initialize: function(options) {
      console.log('MemoFormView.initialize()');
      this.notes = Notes.getInstance();
      this.tags = Tags.getInstance();
    },
    onShow: function() {
      var notes_view, tags_view;
      console.log('onShow()');
      notes_view = new MemoFormNotesView({
        collection: this.notes
      });
      this.note_container.show(notes_view);
      tags_view = new MemoFormTagsView({
        collection: this.tags
      });
      this.tag_container.show(tags_view);
    }
  });
});
