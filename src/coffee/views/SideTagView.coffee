define [
	'underscore'
	'marionette'
	'vent'
	'templates'
], (_, Marionette, vent, templates) ->
	'use strict'
	console.log 'read SideTagView'

	return Marionette.ItemView.extend
		tagName: 'label'
		className: 'btn btn-success'
		template: _.template(templates.side.tag)
		ui:
			radio: 'input[type="radio"]'
		events:
			'click': 'onClickToggle'

		onRender: ->
			# console.log 'SideTagView.onRender()'
			if @model.get('is_active') == 1
				@ui.radio.prop('checked', true)
				@$el.addClass('active')
			return

		onClickToggle: ->
			console.log 'SideTagView.onClickToggle()'
			# @model.set('is_active', 1)
			@model.activeToggle()
			console.log 'in SideTagView.onClickToggle()'
			console.log @model
			console.log @model.toJSON()
			console.log @model.url()
			@model.save().done( (models, response, options)->
				console.log 'save done'

				console.log @
				console.log models
				console.log response
				console.log options
				return
			).fail( ->
				console.log 'tag model save() fail'
				return
			)
			return
