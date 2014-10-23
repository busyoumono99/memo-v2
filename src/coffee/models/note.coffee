define [
	'backbone'
	'backbone-relational-amd'
], (Backbone) ->
	'use strict'
	console.log 'run note'

	Note = Backbone.RelationalModel.extend
		defaults:
			name: ''
			is_default: 0
			is_active: 0
		url: () ->
			'../../data.memo/notes'

	Note.setup()
