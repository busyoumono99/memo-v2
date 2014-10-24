define(['marionette', 'views/AppLayoutView', 'views/memo/MemoListView', 'collections/memos', 'app', 'vent'], function(Marionette, AppLayoutView, MemoListView, Memos, app, vent) {
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
      this.collection = new Memos();
      return this.collection.fetch();
    },
    memoList: function() {
      var list_view;
      console.log('run memoList()');
      list_view = new MemoListView({
        collection: this.collection
      });
      app.main.currentView.content.show(list_view);
    },
    memoForm: function(id) {},
    memoAdd: function() {},
    memoDelete: function(id) {}
  });
  return MemoController;
});
