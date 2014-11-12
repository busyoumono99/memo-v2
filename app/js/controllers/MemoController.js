define(['marionette', 'views/AppLayoutView', 'views/memo/MemoListView', 'views/memo/MemoFormView', 'views/memo/MemoDeleteModalView', 'models/memo', 'collections/memos', 'collections/notes', 'app', 'vent'], function(Marionette, AppLayoutView, MemoListView, MemoFormView, MemoDeleteModalView, Memo, Memos, Notes, app, vent) {
  'use strict';
  var MemoController;
  console.log('run MemoController');
  MemoController = Marionette.Controller.extend({
    initialize: function(options) {
      var applayout;
      console.log('MemoController.initialize()');
      applayout = new AppLayoutView();
      app.main.show(applayout);
      applayout.render();
      this.collection = Memos.getInstance();
    },
    memoList: function() {
      var list_view;
      console.log('run memoList()');
      list_view = new MemoListView({
        collection: this.collection
      });
      app.main.currentView.content.show(list_view);
      list_view.on('childview:memo:delete', this.memoDelete, this);
    },
    memoForm: function(id) {},
    memoAdd: function() {
      var create_view, new_meno, test;
      console.log('run memoAdd()');
      test = Notes.getInstance();
      new_meno = new Memo();
      create_view = new MemoFormView({
        model: new_meno
      });
      app.main.currentView.content.show(create_view);
    },
    memoDelete: function(childview) {
      var d_modal;
      d_modal = new MemoDeleteModalView({
        model: childview.model
      });
      d_modal.on('memo:destroy', this.memoDestroy, this);
      vent.trigger('modal:show', d_modal);
    },
    memoDestroy: function(modalView) {
      modalView.model.destroy();
      vent.trigger('modal:close');
    }
  });
  return MemoController;
});
