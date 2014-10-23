define(['backbone', 'models/memo'], function(Backbone, Memo) {
  'use strict';
  console.log('run memos');
  return Backbone.Collection.extend({
    model: Memo,
    url: '../../data.memo/memos',
    parse: function(response) {
      console.log('in Memos.parse()');
      console.log(response);
      if (response.memos != null) {
        return response.memos;
      }
      return response;
    }
  });
});
