define(['underscore', 'marionette', 'vent', 'templates', 'views/SideTagView'], function(_, Marionette, vent, templates, SideTagView) {
  'use strict';
  console.log('read SideTagsView');
  return Marionette.CompositeView.extend({
    className: 'sidebar-nav navbar-collapse',
    template: _.template(templates.side.tag_list),
    childView: SideTagView,
    childViewContainer: '#side-tag-container'
  });
});
