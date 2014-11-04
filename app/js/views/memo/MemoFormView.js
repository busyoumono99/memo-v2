define(['underscore', 'marionette', 'app', 'vent', 'templates', 'collections/notes', 'views/memo/MemoFormNotesView'], function(_, Marionette, app, vent, templates, Notes, MemoFormNotesView) {
  'use strict';
  console.log('read MemoFormView');
  console.log(templates);
  return Marionette.LayoutView.extend({
    className: 'row',
    template: _.template(templates.memo.form),
    regions: {
      note_container: '#note-select-container',
      tag_container: '#tag-btn-container'
    },
    initialize: function(options) {
      console.log('MemoFormView.initialize()');
      console.log(app.main.currentView);
      this.notes = Notes.getInstance();
    },
    onShow: function() {
      var notes_view;
      console.log('onShow()');
      notes_view = new MemoFormNotesView({
        collection: this.notes
      });
      this.note_container.show(notes_view);
    }
  });
});
