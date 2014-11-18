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

		activeToggle: ->
			flg = @get('is_active')
			if flg == 1
				flg = 0
			else
				flg = 1
			@set('is_active', flg)


	Tag.setup()
