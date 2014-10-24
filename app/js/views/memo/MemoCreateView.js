define(['underscore', 'marionette', 'vent', 'templates'], function(_, Marionette, vent, templates) {
  'use strict';
  console.log('read MemoCreateView');
  return Marionette.ItemView.extend({
    tagName: 'tr',
    template: _.template(templates.memo.create)
  });
});
