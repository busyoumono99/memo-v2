define(['underscore', 'marionette', 'vent', 'templates'], function(_, Marionette, vent, templates) {
  'use strict';
  console.log('read SideTagView');
  return Marionette.ItemView.extend({
    tagName: 'label',
    className: 'btn btn-success',
    template: _.template(templates.side.tag),
    ui: {
      radio: 'input[type="radio"]'
    },
    events: {
      'click': 'onClickToggle'
    },
    onRender: function() {
      if (this.model.get('is_active') === 1) {
        this.ui.radio.prop('checked', true);
        this.$el.addClass('active');
      }
    },
    onClickToggle: function() {
      console.log('SideTagView.onClickToggle()');
      this.model.activeToggle();
      console.log(this.model.toJSON());
      this.model.save().done(console.log('tag model save() done')).fail(console.log('tag model save() fail'));
    }
  });
});
