define(['backbone', 'models/memo'], function(Backbone, Memo) {
  'use strict';
  var Memos;
  console.log('run memos');
  Memos = Backbone.Collection.extend({
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
  Memos.instance = null;
  Memos.getInstance = function() {
    var istc;
    if (Memos.instance == null) {
      istc = new this();
      Memos.instance = istc;
      Memos.instance.fetch();
    }
    return Memos.instance;
  };
  return Memos;
});
