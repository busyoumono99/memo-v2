define(['underscore', 'marionette', 'app', 'vent', 'templates'], function(_, Marionette, app, vent, templates) {
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
    },
    onShow: function() {
      return console.log('onShow()');
    }
  });
});
