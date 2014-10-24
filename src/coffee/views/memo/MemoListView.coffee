define [
	'underscore'
	'marionette'
	'vent'
	'templates'
	'views/memo/MemoItemView'
], (_, Marionette, vent, templates, MemoItemView) ->
	'use strict'
	console.log 'read MemoItemView'

	return Marionette.CompositeView.extend
		className: 'row'
		template: _.template(templates.memo.memo_list)
		childView: MemoItemView
		childViewContainer: '#list-table tbody'
		# collectionEvents:
		# 	'all': 'render'

