define(['underscore', 'marionette', 'templates'], function(_, Marionette, templates) {
  'use strict';
  console.log('read MemoFormNotesView');
  return Marionette.ItemView.extend({
    initialize: function(attributes, options) {
      console.log('MemoFormNotesView.initialize()');
      this.options = options;
    },
    collectionEvents: {
      "add": "render"
    },
    template: _.template(templates.memo.form_notes),
    serializeData: function() {
      var c_id;
      c_id = Marionette.getOption(this, 'form_model').get('id');
      return {
        items: this.collection.toJSON(),
        current_id: c_id
      };
    }
  });
});
