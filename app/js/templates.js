defin(function(require) {
  return {
    side: {
      note: require('text!templates/side/note'),
      note_list: require('text!templates/side/note_list'),
      sidebar: require('text!templates/side/sidebar'),
      tag: require('text!templates/side/tag'),
      tag_list: require('text!templates/side/tag_list')
    }
  };
});
