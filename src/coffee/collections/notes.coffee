define [
	'backbone'
	'models/note'
], (Backbone, Note) ->
	'use strict'
	console.log 'run notes'

	return Backbone.Collection.extend
		model: Note
		url: '../../data.memo/notes'
		parse: (response) ->
			console.log 'in Notes.parse()'
			console.log response
			if response.notes?
				return response.notes
			response

