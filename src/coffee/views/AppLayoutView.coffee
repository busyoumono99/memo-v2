define [
	'underscore'
	'marionette'
	'templates'
	'models/note'
	'collections/notes'
	'collections/tags'
	'views/SideNotesView'
	'views/SideTagsView'
], (_, Marionette, templates, Note, Notes, Tags, SideNotesView, SideTagsView) ->
	'use strict'

	return Marionette.LayoutView.extend
		className: 'app-layout'

		template: _.template(templates.applayout)

		regions:
			note_list: '#note-list'
			tag_list: '#tag-list'
			content: '#page-wrapper'

		initialize: (options) ->
			@notes = Notes.getInstance()
			@listenTo(@notes, 'sync', @updateNoteList)

			@tags = Tags.getInstance()
			@listenTo(@tags, 'sync', @updateTagList)

			return

		onRender: () ->
			console.log 'onRender()'
			return

		onShow: () ->
			console.log 'onShow()'
			return

		updateNoteList: ->
			all = new Note {
				name: 'All'
				is_default: 0
				is_active: 1
			}
			cloneNotes = @notes.clone()
			cloneNotes.unshift(all)

			notes_view = new SideNotesView {
				collection: cloneNotes
			}
			# console.log notes_view
			@note_list.show(notes_view)
			return

		updateTagList: ->
			# console.log 'run updateTagList()'
			tags_view = new SideTagsView {
				collection: @tags
			}
			# console.log tags_view
			@tag_list.show(tags_view)
			return
