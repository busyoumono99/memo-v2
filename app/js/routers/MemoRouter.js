define(['marionette', 'controllers/MemoController'], function(Marionette, MemoController) {
  'use strict';
  console.log('run MemoRouter');
  return Marionette.AppRouter.extend({
    controller: MemoController,
    appRoutes: {
      '': 'memoList',
      'home': 'memoList',
      'edit/:id': 'memoForm',
      'create/': 'memoAdd',
      'delete/:id': 'memoDelete'
    }
  });
});
