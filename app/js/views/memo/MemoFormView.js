define(['underscore', 'marionette', 'app', 'vent', 'templates', 'models/memo', 'collections/memos', 'collections/notes', 'collections/tags', 'views/memo/MemoFormNotesView', 'views/memo/MemoFormTagsView'], function(_, Marionette, app, vent, templates, Memo, Memos, Notes, Tags, MemoFormNotesView, MemoFormTagsView) {
  'use strict';
  console.log('read MemoFormView');
  return Marionette.LayoutView.extend({
    className: 'row',
    template: _.template(templates.memo.form),
    regions: {
      note_container: '#note-select-container',
      tag_container: '#tag-btn-container'
    },
    ui: {
      'note': '.note-select',
      'tags': '.tag-container',
      'title': '#inputTitle',
      'contents': '#inputContent'
    },
    events: {
      'click .save-btn': 'onClickSaveBtn'
    },
    initialize: function(options) {
      console.log('MemoFormView.initialize()');
      this.notes = Notes.getInstance();
      this.tags = Tags.getInstance();
    },
    onShow: function() {
      var notes_view, tags_view;
      console.log('onShow()');
      notes_view = new MemoFormNotesView({
        collection: this.notes
      });
      this.note_container.show(notes_view);
      tags_view = new MemoFormTagsView({
        collection: this.tags
      });
      this.tag_container.show(tags_view);
    },
    onClickSaveBtn: function() {
      var $tags, self_model, tmp_tags;
      console.log('MemoFormView.onClickSaveBtn()');
      this.bindUIElements();
      $tags = this.ui.tags.find('.btn.active');
      tmp_tags = new Tags();
      $tags.each((function(_this) {
        return function(index, tag) {
          tmp_tags.add(_this.tags.get($(tag).data('id')));
        };
      })(this));
      this.model.set({
        title: this.ui.title.val().trim(),
        content: this.ui.contents.val().trim(),
        note_id: this.ui.note.val(),
        tags: tmp_tags
      });
      self_model = this.model;
      self_model.save().done(function(models, response, options) {
        console.log('save done');
        Memos.getInstance().add(self_model);
      }).fail(function(models, response, options) {
        console.log('save fail');
      });
    }
  });
});
