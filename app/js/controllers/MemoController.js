define(['marionette', 'views/AppLayoutView', 'app', 'vent'], function(Marionette, AppLayoutView, app, vent) {
  'use strict';
  var MemoController;
  console.log('run MemoController');
  MemoController = Marionette.Controller.extend({
    initialize: function(options) {
      var applayout;
      applayout = new AppLayoutView();
      app.main.show(applayout);
      return applayout.render();
    },
    memoList: function() {
      console.log('run memoList()');
      this.initialize();
    },
    memoForm: function(id) {},
    memoAdd: function() {},
    memoDelete: function(id) {}
  });
  return MemoController;
});
