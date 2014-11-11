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

		triggers:
			'click .delete-btn' : 'memo:delete'
