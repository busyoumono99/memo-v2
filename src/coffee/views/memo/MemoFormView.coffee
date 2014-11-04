define [
	'underscore'
	'marionette'
	'app'
	'vent'
	'templates'
	'collections/notes'
	'views/memo/MemoFormNotesView'
], (_, Marionette, app, vent, templates, Notes, MemoFormNotesView) ->
	'use strict'

	console.log 'read MemoFormView'
	console.log templates

	return Marionette.LayoutView.extend
		className: 'row'
		template: _.template(templates.memo.form)
		regions:
			note_container: '#note-select-container'
			tag_container: '#tag-btn-container'

		initialize: (options) ->
			console.log 'MemoFormView.initialize()'
			console.log app.main.currentView
			@notes = Notes.getInstance()
			return

		onShow: () ->
			console.log 'onShow()'
			notes_view = new MemoFormNotesView {
				collection: @notes
			}
			# console.log notes_view
			@note_container.show(notes_view)

			return
