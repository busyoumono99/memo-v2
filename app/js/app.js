define(['marionette'], function(Marionette) {
  'use strict';
  var ModalRegion, app;
  console.log('run app.js');
  app = new Marionette.Application();
  ModalRegion = Marionette.Region.extend({
    el: '#modal',
    onShow: function(view) {
      view.on('close', this.hideModal, this);
      this.$el.modal('show');
    },
    hideModal: function() {
      this.$el.modal('hide');
    }
  });
  app.addRegions({
    main: '#main',
    modal: ModalRegion
  });
  app.on('start', function() {
    console.log('run app:start');
    Backbone.history.start();
  });
  app.vent.on('app:show', function(sideView, appView) {
    app.sidenav.show(sideView);
    app.content.show(appView);
  });
  app.vent.on('modal:show', function(view) {
    console.log(view);
    console.log(app.modal);
    app.modal.show(view);
  });
  app.vent.on('modal:close', function() {
    return app.modal.hideModal();
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
