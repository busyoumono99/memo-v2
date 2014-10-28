define [
	'collections/memos'
	'collections/notes'
	'collections/tags'
], (Memos, Notes, Tags) ->
	'use strict'
	console.log 'read ModelMgr'

	class ModelMgr
		instance = null
		class PrivateClass
			constructor: () ->
				@memos = new Memos()
				@notes = new Notes()
				@tags = new Tags()
				@memos.fetch()
				@notes.fetch()
				@tags.fetch()
		@get: ->
			instance ?= new PrivateClass()

	ModelMgr

