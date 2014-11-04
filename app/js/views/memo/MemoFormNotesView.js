define(['underscore', 'marionette', 'templates'], function(_, Marionette, templates) {
  'use strict';
  console.log('read MemoFormNotesView');
  return Marionette.ItemView.extend({
    collectionEvents: {
      "add": "render"
    },
    template: _.template(templates.memo.form_notes),
    serializeData: function() {
      return {
        items: this.collection.toJSON()
      };
    }
  });
});
