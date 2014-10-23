define [
	'backbone'
	'backbone-relational-amd'
], (Backbone) ->
	'use strict'
	console.log 'run tag'

	Tag = Backbone.RelationalModel.extend
		defaults:
			name: ''
			is_active: 0
		parse: (response) ->
			# console.log 'in Tag.parse()'
			# console.log response
			response
		url: ->
			'../../data.memo/tags'


	Tag.setup()
