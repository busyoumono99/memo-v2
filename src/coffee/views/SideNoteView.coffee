define [
	'underscore'
	'marionette'
	# 'vent'
	'templates'
# ], (_, Marionette, vent, templates) ->
], (_, Marionette, templates) ->
	'use strict'

	console.log 'SideNoteView'

	return Marionette.ItemView.extend
		className: 'btn btn-success'

		tagName: 'label'

		template: _.template(templates.side.note)

		triggers:
			### MemoControllerがリッスン(予定) ###
			'click' : 'note:toggle'

		onShow: ->
			console.log 'SideNoteView.onShow()'
			@$el.button()
			return
