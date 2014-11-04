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
    },
    onRender: function() {
      console.log('onRender()');
    },
    onShow: function() {
      var all;
      console.log('onShow()');
      all = new Note({
        name: 'All',
        is_default: 0,
        is_active: 1
      });
      this.notes.fetch().done((function(_this) {
        return function() {
          var notes_view;
          _this.notes.unshift(all);
          notes_view = new SideNotesView({
            collection: _this.notes
          });
          _this.note_list.show(notes_view);
        };
      })(this));
    }
  });
});
