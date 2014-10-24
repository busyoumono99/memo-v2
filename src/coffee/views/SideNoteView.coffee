define [
	'underscore'
	'marionette'
	'vent'
	'templates'
], (_, Marionette, vent, templates) ->
# ], (_, Marionette, templates) ->
	'use strict'

	console.log 'SideNoteView'

	return Marionette.ItemView.extend
		tagName: 'label'
		className: 'btn btn-success'
		template: _.template(templates.side.note)
		ui:
			radio: "input[type='radio']"
		events:
			'click': 'onClickToggle'


		onRender: ->
			console.log 'SideNoteView.onRender()'
			# console.log @model
			if @model.get('is_active') == 1
				# console.log  'is active'
				@ui.radio.prop('checked', true)
				@$el.addClass('active')
			# @$el.button()
			return

		onClickToggle: ->
			console.log new Date().toString()
			console.log 'SideNoteView.onClickToggle()'
			# console.log @model.collection.toJSON()
			@model.collection.each (model)->
				model.set 'is_active', 0
			@model.set('is_active', 1)
			# console.log @model.collection.toJSON()
			return

