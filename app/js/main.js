'use strict';
console.log('run main.js');

define(['jquery', 'underscore', 'backbone', 'bootstrap', 'metisMenu', 'sb_admin_2', 'app', 'routers/MemoRouter', 'controllers/MemoController'], function($, _, Backbone, bootstrap, metisMenu, sb_admin_2, app, MemoRouter, MemoController) {
  var options;
  options = {
    routers: {
      memo: {
        r: MemoRouter,
        c: MemoController
      }
    }
  };
  app.start(options);
});
