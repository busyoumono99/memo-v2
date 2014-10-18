## 導入
* bower.jsonのdependenciesにbackbone-relational-amdを追加
* bower installでインストール

## requirejsのmain.js設定
* pathに以下を追加
	- 'backbone-relational-amd':'../bower_components/backbone-relational-amd/backbone-relational'
* requireに以下を追加
	- 'backbone'
	- 'backbone-relational-amd'
* requireの変数設定
	- Backbone
	- backbone-relational-amdの変数は不要

## チェック
```coffee
test_model = new Backbone.RelationalModel()
console.log test_model
```

## 今回のデータ構成
* memo,note,tag
* note：hasmany > memo
* memo:belongto > note, hasmany > tag
* tag:hasmany : memo

## jsonデータの整形
* 排出されるjsonの形をサーバ側で整える
* 以下jsonサンプル
```json
{
  "memos": [
    {
      "id": 3,
      "title": "test1",
      "content": "test1",
      "completed": null,
      "display_sort": null,
      "note_id": 1,
      "created": "2014-10-17 20:21:24",
      "modified": "2014-10-17 20:21:24",
      "note": {
        "id": 1,
        "name": "note1",
        "is_default": true,
        "is_active": true,
        "created": "2014-03-07 20:35:00",
        "modified": "2014-10-15 14:13:36"
      },
      "tags": [
        {
          "id": "1",
          "name": "tag 1",
          "is_active": false,
          "created": "2014-03-10 11:50:11",
          "modified": "2014-10-15 14:13:41",
          "MemosTag": {
            "id": "3",
            "tag_id": "1",
            "memo_id": "132",
            "created": null,
            "modified": null
          }
        },
        {
          "id": "2",
          "name": "tag 2",
          "is_active": false,
          "created": "2014-03-10 11:50:36",
          "modified": "2014-10-15 14:13:40",
          "MemosTag": {
            "id": "4",
            "tag_id": "2",
            "memo_id": "132",
            "created": null,
            "modified": null
          }
        }
      ]
    },
    {
      "id": 133,
      "title": "test2",
      "content": "test2",
      "completed": null,
      "display_sort": null,
      "note_id": 1,
      "created": "2014-10-17 20:23:27",
      "modified": "2014-10-17 20:23:27",
      "note": {
        "id": 1,
        "name": "note1",
        "is_default": true,
        "is_active": true,
        "created": "2014-03-07 20:35:00",
        "modified": "2014-10-15 14:13:36"
      },
      "tags": [
        {
          "id": "1",
          "name": "tag 1",
          "is_active": false,
          "created": "2014-03-10 11:50:11",
          "modified": "2014-10-15 14:13:41",
          "MemosTag": {
            "id": "5",
            "tag_id": "1",
            "memo_id": "133",
            "created": null,
            "modified": null
          }
        },
        {
          "id": "2",
          "name": "tag 2",
          "is_active": false,
          "created": "2014-03-10 11:50:36",
          "modified": "2014-10-15 14:13:40",
          "MemosTag": {
            "id": "6",
            "tag_id": "2",
            "memo_id": "133",
            "created": null,
            "modified": null
          }
        }
      ]
    }
  ]
}
```

## jsonデータのurl
* memos
* notes
* tags

## relationalモデルとコレクションの設定
* Backbone.RelationalModel.extendでmemo,tag,noteモデルとtagsコレクションを作成
* 今回はモデルクラスを変数代入形式でする
	- ネットの情報ではcoffeeのclassを使っている所ばかり
* amd形式で実装
* coffeeで実装する場合は最後にsetup()を実行する。amd形式なのでそのままreturnする。
* url,parseは必要に応じて設定
* 以下はmemoモデルのrelationsの設定

#### memo.relations
relations: [
	{
	type: Backbone.HasOne
	key: 'note'
	relatedModel: Note
	reverseRelation:
		key: 'memo'
		includeInJSON: false
	},
	{
	type: Backbone.HasMany
	key: 'tags'
	relatedModel: Tag
	collectionType: Tags
	reverseRelation:
		key: 'memo'
		includeInJSON: false
	}
]

## サーバ側のCakephpを保存出来るように対応
* tagはidのみの配列に整形
* saveAll()を使用

## mainでチェック
```coffee
require [
	'models/memo'
	'models/tag'
	'bootstrap'
	'metisMenu'
	'sb_admin_2'
], (Memo, Tag) ->
	memo = new Memo({id:3})
	memo.fetch().then(->
		console.log memo
		note = memo.get("note")
		console.log  note
		console.log  note.url()
		console.log  note.get("name")
		tags = memo.get("tags")
		console.log tags
		# console.log JSON.stringify(memo.toJSON())
		console.log tags.url()
		tag = tags.get(1)
		console.log tag.url()
		console.log tag.get("name")

		memo2 = new Memo()
		memo2.set
			title: "test4"
			content: 'test4'
			note_id: note.get('id')
			tags: tags
		memo2.save()

		console.log memo2
	)
	return
```
