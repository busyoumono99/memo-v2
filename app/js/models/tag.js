define(['backbone', 'backbone-relational-amd'], function(Backbone) {
  'use strict';
  var Tag;
  console.log('run tag');
  Tag = Backbone.RelationalModel.extend({
    defaults: {
      name: '',
      is_active: 0
    },
    parse: function(response) {
      return response;
    },
    url: function() {
      return '../../data.memo/tags';
    },
    activeToggle: function() {
      var flg;
      flg = this.get('is_active');
      if (flg === 1) {
        flg = 0;
      } else {
        flg = 1;
      }
      return this.set('is_active', flg);
    }
  });
  return Tag.setup();
});
