define [
	'backbone'
	'models/tag'
] ,(Backbone, Tag) ->
	'use strict'

	Tags = Backbone.Collection.extend
		url: ->
			id = this.get("tag").id if this.get("tag")
			created = if id then ("/" + id) else ''
			'../../data.memo/tags' + created
		model: Tag
		parse: (response) ->
			# console.log 'in Tags.parse()'
			# console.log response
			response

	Tags
