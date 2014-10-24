define(['marionette', 'views/AppLayoutView', 'app', 'vent'], function(Marionette, AppLayoutView, app, vent) {
  'use strict';
  var MemoController;
  console.log('run MemoController');
  MemoController = Marionette.Controller.extend({
    initialize: function(options) {
      var applayout;
      console.log('MemoController.initialize()');
      applayout = new AppLayoutView();
      app.main.show(applayout);
      return applayout.render();
    },
    memoList: function() {
      console.log('run memoList()');
    },
    memoForm: function(id) {},
    memoAdd: function() {},
    memoDelete: function(id) {}
  });
  return MemoController;
});
