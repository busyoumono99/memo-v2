define [
	'marionette'
	'views/AppLayoutView'
	'views/memo/MemoListView'
	'collections/memos'
	'app'
	'vent'
], (Marionette, AppLayoutView, MemoListView, Memos, app, vent) ->
	'use strict'
	console.log 'run MemoController'

	MemoController = Marionette.Controller.extend
		initialize: (options) ->
			console.log 'MemoController.initialize()'
			applayout = new AppLayoutView()
			app.main.show(applayout)
			applayout.render()
			@collection = new Memos()
			@collection.fetch()

		memoList: ->
			console.log 'run memoList()'
			# @collection.fetch()
			list_view = new MemoListView {
				collection: @collection
			}
			# console.log list_view
			# console.log app.main.currentView
			app.main.currentView.content.show(list_view)
			return
		memoForm: (id) ->
			return
		memoAdd: ->
			return
		memoDelete: (id) ->
			return

	MemoController
