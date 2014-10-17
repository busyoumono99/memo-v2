'use strict'

require.config
	paths:
		jquery:			'../bower_components/jquery/jquery'
		underscore:		'../bower_components/underscore/underscore'
		backbone:		'../bower_components/backbone/backbone'
		'backbone-relational-amd':		'../bower_components/backbone-relational-amd/backbone-relational'
		marionette:		'../bower_components/marionette/lib/backbone.marionette'
		text:			'../bower_components/requirejs-text/text'
		bootstrap:		'../bower_components/bootstrap/dist/js/bootstrap'
		metisMenu:		'../assets/sb-admin-2/js/plugins/metisMenu/metisMenu'
		sb_admin_2:		'../assets/sb-admin-2/js/sb-admin-2'
	shim:
		bootstrap:
			deps: ['jquery']
			exports: 'Bootstrap'
		metisMenu:
			deps: ['bootstrap']
			exports: 'MetisMenu'
		sb_admin_2:
			deps: ['bootstrap']
			exports: 'Sb_admin_2'

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
