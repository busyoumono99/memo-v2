define [
	'underscore'
	'marionette'
	'app'
	'vent'
	'templates'
	'collections/notes'
	'collections/tags'
	'views/memo/MemoFormNotesView'
	'views/memo/MemoFormTagsView'
], (_, Marionette, app, vent, templates, Notes, Tags, MemoFormNotesView, MemoFormTagsView) ->
	'use strict'

	console.log 'read MemoFormView'
	# console.log templates

	return Marionette.LayoutView.extend
		className: 'row'
		template: _.template(templates.memo.form)
		regions:
			note_container: '#note-select-container'
			tag_container: '#tag-btn-container'

		initialize: (options) ->
			console.log 'MemoFormView.initialize()'
			@notes = Notes.getInstance()
			@tags = Tags.getInstance()
			return

		onShow: () ->
			console.log 'onShow()'
			# リージョンにノートとタグの一覧を追加する
			notes_view = new MemoFormNotesView {
				collection: @notes
			}
			@note_container.show(notes_view)

			tags_view = new MemoFormTagsView {
				collection: @tags
			}
			@tag_container.show(tags_view)

			return
