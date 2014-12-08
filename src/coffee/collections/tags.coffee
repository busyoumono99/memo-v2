define [
	'backbone'
	'models/tag'
] ,(Backbone, Tag) ->
	'use strict'
	console.log 'run tags'

	Tags = Backbone.Collection.extend
		model: Tag
		url: '../../data.memo/tags'
		parse: (response) ->
			console.log 'in Tags.parse()'
			console.log response
			if response.tags?
				return response.tags
			response

	Tags.instance = null
	Tags.getInstance = ->
		# console.log 'Note.getInstance()'
		# console.log Tags.instance
		if !Tags.instance?
			istc = new @()
			Tags.instance = istc
			Tags.instance.fetch()
		Tags.instance

	return Tags
