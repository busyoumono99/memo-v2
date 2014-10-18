define [
	'backbone'
	'models/note'
], (Backbone, Note) ->
	'use strict'

	Notes = Backbone.Collection.extend
		model: Note
		url: '../../data.memo/notes'
		parse: (response) ->
			console.log 'in Notes.parse()'
			console.log response
			if response.notes?
				return response.notes
			response

	Notes
