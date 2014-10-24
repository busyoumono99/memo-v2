define(['underscore', 'marionette', 'vent', 'templates'], function(_, Marionette, vent, templates) {
  'use strict';
  console.log('SideNoteView');
  return Marionette.ItemView.extend({
    tagName: 'label',
    className: 'btn btn-success',
    template: _.template(templates.side.note),
    ui: {
      radio: "input[type='radio']"
    },
    events: {
      'click': 'onClickToggle'
    },
    onRender: function() {
      console.log('SideNoteView.onRender()');
      if (this.model.get('is_active') === 1) {
        this.ui.radio.prop('checked', true);
        this.$el.addClass('active');
      }
    },
    onClickToggle: function() {
      console.log(new Date().toString());
      console.log('SideNoteView.onClickToggle()');
      this.model.collection.each(function(model) {
        return model.set('is_active', 0);
      });
      this.model.set('is_active', 1);
    }
  });
});
