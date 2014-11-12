define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoFormNotesView'

	return Marionette.ItemView.extend
		initialize: (attributes, options) ->
			console.log 'MemoFormNotesView.initialize()'
			# console.log options
			@options = options
			# console.log @options
			# m = Marionette.getOption @, 'form_model'
			# console.log m
			return
		collectionEvents: {
			"add": "render"
		}
		template: _.template(templates.memo.form_notes)
		serializeData: ->
			c_id = Marionette.getOption(@, 'form_model').get('id')
			return {
				items: @collection.toJSON()
				current_id: c_id
			}

