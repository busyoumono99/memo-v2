define [
	'underscore'
	'marionette'
	'app'
	'vent'
	'templates'
], (_, Marionette, app, vent, templates) ->
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
			return

		onShow: () ->
			console.log 'onShow()'
			# @notes.add(all)
			# @notes.fetch().done =>
			# 	# console.log @notes

			# 	@notes.unshift(all)

			# 	notes_view = new SideNotesView {
			# 		collection: @notes
			# 	}
			# 	# console.log notes_view
			# 	@note_list.show(notes_view)
			# 	return
