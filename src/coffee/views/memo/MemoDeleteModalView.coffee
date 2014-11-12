define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoDeleteModalView'

	return Marionette.ItemView.extend
		template: _.template(templates.memo.delete_modal)
		triggers:
			'click button[data-destroy=""]' : 'memo:destroy'
