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
		ui:
			spinner		:	'.spinner-container'
			non_memo	:	'.non-memo-container'
		collectionEvents:
			'sync'	:	'updateInfo'
		updateInfo: ->
			# console.log 'MemoListView.updateInfo()'
			if @collection.length > 0
				@ui.spinner.addClass('hidden')
			else if @collection.length == 0
				@ui.spinner.addClass('hidden')
				@ui.non_memo.removeClass('hidden')
			return
		onShow: ->
			# console.log 'MemoListView.onShow()'
			if @collection.isSynced
				@updateInfo()
			return
		# collectionEvents:
		# 	'all': 'render'

