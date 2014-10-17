define [
	'backbone'
	'backbone-relational-amd'
], (Backbone) ->
	'use strict'

	Tag = Backbone.RelationalModel.extend
		parse: (response) ->
			# console.log 'in Tag.parse()'
			# console.log response
			response
		url: ->
			'../../data.memo/tags'


	Tag.setup()
