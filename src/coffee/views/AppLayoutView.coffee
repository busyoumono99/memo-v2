define [
	'underscore'
	'marionette'
	'templates'
	'collections/notes'
	'collections/tags'
	'views/SideNotesView'
], (_, Marionette, templates, Notes, Tags, SideNotesView) ->
	'use strict'

	return Marionette.LayoutView.extend
		className: 'app-layout'

		template: _.template(templates.applayout)

		regions:
			note_list: '#note-list'
			tag_list: '#tag-list'
			content: '#page-wrapper'

		initialize: (options) ->
			@notes = new Notes()

			return

		onRender: () ->
			console.log 'onRender()'
			return

		onShow: () ->
			console.log 'onShow()'

			@notes.fetch().done =>
				console.log @notes

				notes_view = new SideNotesView {
					collection: @notes
				}
				console.log notes_view
				@note_list.show(notes_view)
			return
