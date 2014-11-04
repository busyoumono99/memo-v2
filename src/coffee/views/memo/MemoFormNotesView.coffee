define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoFormNotesView'

	return Marionette.ItemView.extend
		collectionEvents: {
			"add": "render"
		}
		template: _.template(templates.memo.form_notes)
		serializeData: ->
			return {
				items: @collection.toJSON()
			}

