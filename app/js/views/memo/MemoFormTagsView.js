define(['underscore', 'marionette', 'templates'], function(_, Marionette, templates) {
  'use strict';
  console.log('read MemoFormTagsView');
  return Marionette.ItemView.extend({
    initialize: function(attributes, options) {
      this.options = options;
    },
    collectionEvents: {
      "add": "render"
    },
    template: _.template(templates.memo.form_tags),
    serializeData: function() {
      var belong_tags;
      belong_tags = Marionette.getOption(this, 'form_model').get('tags');
      belong_tags.each((function(_this) {
        return function(element, index, array) {
          var belong_id, tag;
          belong_id = element.get('id');
          tag = _this.collection.find(function(tmp_tag) {
            return tmp_tag.get('id') === belong_id;
          });
          if (tag != null) {
            tag.set('selected', true);
          }
        };
      })(this));
      return {
        items: this.collection.toJSON()
      };
    }
  });
});
