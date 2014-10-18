'use strict';
require.config({
  paths: {
    jquery: '../bower_components/jquery/jquery',
    underscore: '../bower_components/underscore/underscore',
    backbone: '../bower_components/backbone/backbone',
    'backbone-relational-amd': '../bower_components/backbone-relational-amd/backbone-relational',
    marionette: '../bower_components/marionette/lib/backbone.marionette',
    text: '../bower_components/requirejs-text/text',
    bootstrap: '../bower_components/bootstrap/dist/js/bootstrap',
    metisMenu: '../assets/sb-admin-2/js/plugins/metisMenu/metisMenu',
    sb_admin_2: '../assets/sb-admin-2/js/sb-admin-2'
  },
  shim: {
    bootstrap: {
      deps: ['jquery'],
      exports: 'Bootstrap'
    },
    metisMenu: {
      deps: ['bootstrap'],
      exports: 'MetisMenu'
    },
    sb_admin_2: {
      deps: ['bootstrap', 'metisMenu'],
      exports: 'Sb_admin_2'
    }
  }
});

require(['models/memo', 'collections/memos', 'collections/notes', 'collections/tags', 'bootstrap', 'metisMenu', 'sb_admin_2'], function(Memo, Memos, Notes, Tags) {
  var memos, notes, tags;
  memos = new Memos();
  memos.fetch().then(function() {
    var memo1;
    memo1 = memos.at(0);
    console.log(memo1);
    memo1.fetch().done(function() {
      var tag, tags1;
      console.log(memo1.toJSON());
      tags1 = memo1.get("tags");
      console.log(tags1);
      console.log(tags1.url());
      tag = tags1.get(1);
      console.log(tag);
      console.log(tag.url());
      console.log(tag.get("name"));
    });
  });
  notes = new Notes();
  notes.fetch().done(function() {
    console.log(notes);
  });
  tags = new Tags();
  tags.fetch().done(function() {
    console.log(tags);
  });
});
