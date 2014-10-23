define(['underscore', 'marionette', 'templates', 'collections/notes', 'collections/tags', 'views/SideNotesView'], function(_, Marionette, templates, Notes, Tags, SideNotesView) {
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
      this.notes = new Notes();
    },
    onRender: function() {
      console.log('onRender()');
    },
    onShow: function() {
      console.log('onShow()');
      this.notes.fetch().done((function(_this) {
        return function() {
          var notes_view;
          console.log(_this.notes);
          notes_view = new SideNotesView({
            collection: _this.notes
          });
          console.log(notes_view);
          return _this.note_list.show(notes_view);
        };
      })(this));
    }
  });
});
