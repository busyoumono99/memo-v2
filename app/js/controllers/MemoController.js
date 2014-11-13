define(['marionette', 'views/AppLayoutView', 'views/memo/MemoListView', 'views/memo/MemoFormView', 'views/memo/MemoDeleteModalView', 'views/memo/MemoSaveModalView', 'models/memo', 'collections/memos', 'collections/notes', 'collections/tags', 'app', 'vent'], function(Marionette, AppLayoutView, MemoListView, MemoFormView, MemoDeleteModalView, MemoSaveModalView, Memo, Memos, Notes, Tags, app, vent) {
  'use strict';
  var MemoController;
  console.log('run MemoController');
  MemoController = Marionette.Controller.extend({
    initialize: function(options) {
      var applayout;
      console.log('MemoController.initialize()');
      applayout = new AppLayoutView();
      app.main.show(applayout);
      applayout.render();
      this.collection = Memos.getInstance();
    },
    memoList: function() {
      var list_view;
      console.log('run memoList()');
      list_view = new MemoListView({
        collection: this.collection
      });
      app.main.currentView.content.show(list_view);
      list_view.on('childview:memo:delete', this.memoDelete, this);
    },
    memoForm: function(id) {
      var edit_memo, form_view;
      console.log('run memoAdd()');
      edit_memo = Memos.getInstance().get(id);
      form_view = new MemoFormView({
        model: edit_memo
      });
      app.main.currentView.content.show(form_view);
      form_view.on('memo:save', this.saveMemo, this);
    },
    memoAdd: function() {
      var create_view, new_meno, test;
      console.log('run memoAdd()');
      test = Notes.getInstance();
      new_meno = new Memo();
      create_view = new MemoFormView({
        model: new_meno
      });
      app.main.currentView.content.show(create_view);
    },
    saveMemo: function(args) {
      var $tags, model, tmp_tags, view;
      console.log('MemoController.saveMemo()');
      view = args.view;
      model = args.model;
      view.bindUIElements();
      $tags = view.ui.tags.find('.btn.active');
      tmp_tags = new Tags();
      $tags.each((function(_this) {
        return function(index, tag) {
          tmp_tags.add(view.tags.get($(tag).data('id')));
        };
      })(this));
      model.set({
        title: view.ui.title.val().trim(),
        content: view.ui.contents.val().trim(),
        note_id: view.ui.note.val(),
        tags: tmp_tags
      });
      model.save().done(function(models, response, options) {
        var s_modal;
        console.log('save done');
        Memos.getInstance().add(model);
        s_modal = new MemoSaveModalView();
        s_modal.on('memo:go_list', this.goList, this);
        vent.trigger('modal:show', s_modal);
      }).fail(function(models, response, options) {
        console.log('save fail');
      });
    },
    goList: function() {
      Backbone.navigate('#', {
        trigger: true
      });
    },
    memoDelete: function(childview) {
      var d_modal;
      d_modal = new MemoDeleteModalView({
        model: childview.model
      });
      d_modal.on('memo:destroy', this.memoDestroy, this);
      vent.trigger('modal:show', d_modal);
    },
    memoDestroy: function(modalView) {
      modalView.model.destroy();
      vent.trigger('modal:close');
    }
  });
  return MemoController;
});
