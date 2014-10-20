'use strict';
require(['models/memo', 'collections/memos', 'collections/notes', 'collections/tags', 'bootstrap', 'metisMenu', 'sb_admin_2'], function(Memo, Memos, Notes, Tags) {
  var memos, notes, tags;
  memos = new Memos();
  memos.fetch().then(function() {
    var memo1;
    memo1 = memos.at(0);
    console.log(memo1);
    memo1.fetch().done(function() {
      var tag, tags1;
      console.log(memo1.toJSON());
      tags1 = memo1.get("tags");
      console.log(tags1);
      console.log(tags1.url());
      tag = tags1.get(1);
      console.log(tag);
      console.log(tag.url());
      console.log(tag.get("name"));
    });
  });
  notes = new Notes();
  notes.fetch().done(function() {
    console.log(notes);
  });
  tags = new Tags();
  tags.fetch().done(function() {
    console.log(tags);
  });
});
