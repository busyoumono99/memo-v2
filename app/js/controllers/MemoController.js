define(['marionette', 'views/AppLayoutView', 'views/memo/MemoListView', 'views/memo/MemoFormView', 'models/memo', 'collections/memos', 'collections/notes', 'app', 'vent'], function(Marionette, AppLayoutView, MemoListView, MemoFormView, Memo, Memos, Notes, app, vent) {
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
    memoDelete: function(id) {}
  });
  return MemoController;
});
