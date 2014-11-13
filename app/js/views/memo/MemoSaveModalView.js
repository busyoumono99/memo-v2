define(['underscore', 'marionette', 'templates'], function(_, Marionette, templates) {
  'use strict';
  console.log('read MemoSaveModalView');
  return Marionette.ItemView.extend({
    template: _.template(templates.memo.save_modal),
    triggers: {
      'click button[data-go-list=""]': 'memo:go_list'
    }
  });
});
