define [
	'underscore'
	'marionette'
	'vent'
	'templates'
	'views/SideNoteView'
], (_, Marionette, vent, templates, SideNoteView) ->
	'use strict'
	console.log 'SideNotesView'

	return Marionette.CompositeView.extend
		className: 'sidebar-nav navbar-collapse'
		template: _.template(templates.side.note_list)
		childView: SideNoteView
		childViewContainer: '#side-note-container'
		# collectionEvents:
		# 	'all': 'render'
		initialize: ->
			# console.log  'SideNotesView.initialize()'







