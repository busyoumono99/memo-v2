define(['underscore', 'marionette', 'templates', 'app'], function(_, Marionette, templates, app) {
  'use strict';
  console.log('read MemoSaveModalView');
  return Marionette.ItemView.extend({
    template: _.template(templates.memo.save_modal),
    onShow: function() {
      return app.modal.$el.one('hidden.bs.modal', (function(_this) {
        return function(e) {
          return _this.trigger('memo:go_list');
        };
      })(this));
    }
  });
});
