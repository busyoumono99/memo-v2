'use strict';
require.config({
  paths: {
    jquery: '../bower_components/jquery/jquery',
    underscore: '../bower_components/underscore/underscore',
    backbone: '../bower_components/backbone/backbone',
    marionette: '../bower_components/marionette/lib/backbone.marionette',
    text: '../bower_components/requirejs-text/text',
    bootstrap: '../bower_components/bootstrap/dist/js/bootstrap'
  },
  shim: {
    bootstrap: {
      deps: ['jquery'],
      exports: 'Bootstrap'
    }
  }
});

require(['bootstrap'], function() {});
