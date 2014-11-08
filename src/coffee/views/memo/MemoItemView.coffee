define [
	'underscore'
	'marionette'
	'vent'
	'templates'
], (_, Marionette, vent, templates) ->
	'use strict'

	console.log 'read MemoItemView'

	return Marionette.ItemView.extend
		tagName: 'tr'
		template: _.template(templates.memo.memo)
		ui:
			delete_btn: '.delete-btn'
