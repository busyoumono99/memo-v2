define(['marionette'], function(Marionette) {
  'use strict';
  var app;
  console.log('run app.js');
  app = new Marionette.Application();
  app.addRegions({
    main: '#main'
  });
  app.on('start', function() {
    console.log('run app:start');
    Backbone.history.start();
  });
  app.vent.on('app:show', function(sideView, appView) {
    app.sidenav.show(sideView);
    app.content.show(appView);
  });
  app.addInitializer(function(options) {
    _.each(options.routers, function(router) {
      var c, r;
      console.log('new router');
      c = new router.c();
      r = new router.r({
        controller: c
      });
    });
  });
  return app;
});
