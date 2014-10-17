define [
	'backbone'
	'backbone-relational-amd'
], (Backbone) ->
	'use strict'


	Note = Backbone.RelationalModel.extend
		url: () ->
			'../../data.memo/notes'

	Note.setup()
