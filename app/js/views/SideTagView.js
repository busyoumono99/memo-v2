define(['underscore', 'marionette', 'vent', 'templates'], function(_, Marionette, vent, templates) {
  'use strict';
  console.log('read SideTagView');
  return Marionette.ItemView.extend({
    tagName: 'label',
    className: 'btn btn-success',
    template: _.template(templates.side.tag),
    ui: {
      checkbox: 'input[type="checkbox"]'
    },
    events: {
      'click': 'onClickToggle'
    },
    onRender: function() {
      if (this.model.get('is_active')) {
        this.$el.button('toggle');
      }
    },
    onClickToggle: function() {
      console.log('SideTagView.onClickToggle()');
      this.model.activeToggle();
      console.log('in SideTagView.onClickToggle()');
      console.log(this.model);
      console.log(this.model.toJSON());
      console.log(this.model.url());
      this.model.save().done(function(models, response, options) {
        console.log('save done');
        console.log(this);
        console.log(models);
        console.log(response);
        console.log(options);
      }).fail(function() {
        console.log('tag model save() fail');
      });
    }
  });
});
