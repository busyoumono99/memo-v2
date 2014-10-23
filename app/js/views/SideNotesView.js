define(['underscore', 'marionette', 'vent', 'templates', 'views/SideNoteView'], function(_, Marionette, vent, templates, SideNoteView) {
  'use strict';
  console.log('SideNotesView');
  return Marionette.CompositeView.extend({
    className: 'sidebar-nav navbar-collapse',
    template: _.template(templates.side.note_list),
    childView: SideNoteView,
    childViewContainer: '#side-note-container',
    collectionEvents: {
      'all': 'render'
    },
    onShow: function() {
      console.log('SideNotesView.onShow()');
    },
    initialize: function() {
      'SideNotesView.initialize()';
      return this.render();
    }
  });
});
