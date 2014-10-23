define(['underscore', 'marionette', 'templates'], function(_, Marionette, templates) {
  'use strict';
  console.log('SideNoteView');
  return Marionette.ItemView.extend({
    className: 'btn btn-success',
    tagName: 'label',
    template: _.template(templates.side.note),
    triggers: {

      /* MemoControllerがリッスン(予定) */
      'click': 'note:toggle'
    },
    onShow: function() {
      console.log('SideNoteView.onShow()');
      this.$el.button();
    }
  });
});
