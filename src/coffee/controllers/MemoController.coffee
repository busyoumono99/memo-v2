define [
	'marionette'
	'views/AppLayoutView'
	'views/memo/MemoListView'
	'views/memo/MemoFormView'
	'models/memo'
	'collections/memos'
	'app'
	'vent'
	'ModelMgr'
], (Marionette, AppLayoutView, MemoListView, MemoFormView, Memo, Memos, app, vent, ModelMgr) ->
	'use strict'
	console.log 'run MemoController'

	MemoController = Marionette.Controller.extend
		initialize: (options) ->
			console.log 'MemoController.initialize()'
			applayout = new AppLayoutView()
			app.main.show(applayout)
			applayout.render()
			@collection =  ModelMgr.get().memos

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
			console.log 'run memoAdd()'
			new_meno = new Memo()
			create_view = new MemoFormView {
				model: new_meno
			}
			app.main.currentView.content.show(create_view)
			return
		memoDelete: (id) ->
			return

	MemoController
