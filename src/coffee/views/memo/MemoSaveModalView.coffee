define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoSaveModalView'

	return Marionette.ItemView.extend
		template: _.template(templates.memo.save_modal)
