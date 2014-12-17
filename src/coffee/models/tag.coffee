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
		activeToggle: ->
			flg = @get('is_active')
			if flg
				flg = false
			else
				flg = true
			@set('is_active', flg)


	Tag.setup()
