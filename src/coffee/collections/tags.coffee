define [
	'backbone'
	'models/tag'
] ,(Backbone, Tag) ->
	'use strict'
	console.log 'run tags'

	Tags = Backbone.Collection.extend
		url: ->
			id = this.get("tag").id if this.get("tag")
			created = if id then ("/" + id) else ''
			'../../data.memo/tags' + created
		model: Tag
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
