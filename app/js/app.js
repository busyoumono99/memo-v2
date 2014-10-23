define(['marionette'], function(Marionette) {
  'use strict';
  var app;
  console.log('run app.js');
  app = new Marionette.Application();
  app.addRegions({
    main: '#main'
  });
  app.on('initialize:after', function() {
    Backbone.history.start();
  });
  app.vent.on('app:show', function(sideView, appView) {
    app.sidenav.show(sideView);
    app.content.show(appView);
  });
  app.addInitializer(function(options) {
    console.log(options.routers);
    console.log(options.routers.memo);
    _.each(options.routers, function(router) {
      var c, r;
      console.log('new router');
      console.log(router);
      c = new router.c();
      r = new router.r({
        controller: c
      });
      console.log(r);
    });
  });
  return app;
});
