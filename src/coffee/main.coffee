'use strict'

require [
	'models/memo'
	'collections/memos'
	'collections/notes'
	'collections/tags'
	'bootstrap'
	'metisMenu'
	'sb_admin_2'
], (Memo, Memos, Notes, Tags) ->
	memos = new Memos()
	memos.fetch().then(->
		# console.log memos
		# console.log memos.toJSON()
		memo1 = memos.at(0)
		console.log memo1
		memo1.fetch().done(->
			console.log memo1.toJSON()
			tags1 = memo1.get("tags")
			console.log tags1
			console.log tags1.url()
			tag = tags1.get(1)
			console.log tag
			console.log tag.url()
			console.log tag.get("name")
			return
		)
		return
	)

	notes = new Notes()
	notes.fetch().done ->
		console.log notes
		return

	tags = new Tags()
	tags.fetch().done ->
		console.log tags
		return

	return


