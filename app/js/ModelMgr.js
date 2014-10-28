define(['collections/memos', 'collections/notes', 'collections/tags'], function(Memos, Notes, Tags) {
  'use strict';
  var ModelMgr;
  console.log('read ModelMgr');
  ModelMgr = (function() {
    var PrivateClass, instance;

    function ModelMgr() {}

    instance = null;

    PrivateClass = (function() {
      function PrivateClass() {
        this.memos = new Memos();
        this.notes = new Notes();
        this.tags = new Tags();
        this.memos.fetch();
        this.notes.fetch();
        this.tags.fetch();
      }

      return PrivateClass;

    })();

    ModelMgr.get = function() {
      return instance != null ? instance : instance = new PrivateClass();
    };

    return ModelMgr;

  })();
  return ModelMgr;
});
