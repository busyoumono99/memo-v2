define [
	'backbone'
	'models/note'
], (Backbone, Note) ->
	'use strict'
	console.log 'run notes'

	Notes = Backbone.Collection.extend
		model: Note
		url: '../../data.memo/notes'
		parse: (response) ->
			console.log 'in Notes.parse()'
			console.log response
			if response.notes?
				return response.notes
			response


	Notes.instance = null
	Notes.getInstance = ->
		# console.log 'Note.getInstance()'
		# console.log Notes.instance
		if !Notes.instance?
			istc = new @()
			Notes.instance = istc
			Notes.instance.fetch()
		Notes.instance

	return Notes
