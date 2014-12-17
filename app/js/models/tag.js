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
    activeToggle: function() {
      var flg;
      flg = this.get('is_active');
      if (flg) {
        flg = false;
      } else {
        flg = true;
      }
      return this.set('is_active', flg);
    }
  });
  return Tag.setup();
});
