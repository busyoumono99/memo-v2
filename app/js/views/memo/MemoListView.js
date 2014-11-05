define(['underscore', 'marionette', 'vent', 'templates', 'views/memo/MemoItemView'], function(_, Marionette, vent, templates, MemoItemView) {
  'use strict';
  console.log('read MemoItemView');
  return Marionette.CompositeView.extend({
    className: 'row',
    template: _.template(templates.memo.memo_list),
    childView: MemoItemView,
    childViewContainer: '#list-table tbody',
    ui: {
      spinner: '.spinner-container',
      non_memo: '.non-memo-container'
    },
    collectionEvents: {
      'sync': 'updateInfo'
    },
    updateInfo: function() {
      if (this.collection.length > 0) {
        this.ui.spinner.addClass('hidden');
      } else if (this.collection.length === 0) {
        this.ui.spinner.addClass('hidden');
        this.ui.non_memo.removeClass('hidden');
      }
    },
    onShow: function() {
      if (this.collection.isSynced) {
        this.updateInfo();
      }
    }
  });
});
