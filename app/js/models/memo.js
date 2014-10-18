define(['backbone', 'models/note', 'models/tag', 'collections/tags', 'backbone-relational-amd'], function(Backbone, Note, Tag, Tags) {
  'use strict';
  var Memo;
  Memo = Backbone.RelationalModel.extend({
    defaults: {
      title: '',
      content: '',
      completed: 0,
      display_sort: 0
    },
    urlRoot: '../../data.memo/memos',
    relations: [
      {
        type: Backbone.HasOne,
        key: 'note',
        relatedModel: Note,
        reverseRelation: {
          key: 'memo',
          includeInJSON: false
        }
      }, {
        type: Backbone.HasMany,
        key: 'tags',
        relatedModel: Tag,
        collectionType: Tags,
        reverseRelation: {
          key: 'memo',
          includeInJSON: false
        }
      }
    ],
    parse: function(response) {
      var result;
      result = null;
      if (response.memos[0] != null) {
        result = response.memos[0];
      } else {
        result = response;
      }
      return result;
    }
  });
  return Memo.setup();
});
