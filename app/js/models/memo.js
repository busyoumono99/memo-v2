define(['backbone', 'models/note', 'models/tag', 'collections/tags', 'backbone-relational-amd'], function(Backbone, Note, Tag, Tags) {
  'use strict';
  var Memo;
  console.log('run memos');
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
          key: 'memos',
          includeInJSON: false
        }
      }, {
        type: Backbone.HasMany,
        key: 'tags',
        relatedModel: Tag,
        collectionType: Tags,
        reverseRelation: {
          key: 'memos',
          includeInJSON: false
        }
      }
    ],
    parse: function(response) {
      var result, _ref;
      result = null;
      if (((_ref = response.memos) != null ? _ref[0] : void 0) != null) {
        result = response.memos[0];
      } else {
        result = response;
      }
      return result;
    }
  });
  return Memo.setup();
});
