define [
	'marionette'
	'views/AppLayoutView'
	'views/memo/MemoListView'
	'views/memo/MemoFormView'
	'models/memo'
	'collections/memos'
	'collections/notes'
	'app'
	'vent'
], (Marionette, AppLayoutView, MemoListView, MemoFormView, Memo, Memos, Notes, app, vent) ->
	'use strict'
	console.log 'run MemoController'

	MemoController = Marionette.Controller.extend
		initialize: (options) ->
			console.log 'MemoController.initialize()'
			applayout = new AppLayoutView()
			app.main.show(applayout)
			applayout.render()
			@collection = Memos.getInstance()
			return

		memoList: ->
			console.log 'run memoList()'
			# @collection.fetch()
			list_view = new MemoListView {
				collection: @collection
			}
			# console.log list_view
			# console.log app.main.currentView
			app.main.currentView.content.show(list_view)

			# MemoItemViewの削除用のトリガーイベントの購読
			list_view.on 'childview:memo:delete', @memoDelete, @
			return
		memoForm: (id) ->
			return
		memoAdd: ->
			console.log 'run memoAdd()'
			test = Notes.getInstance()
			new_meno = new Memo()
			create_view = new MemoFormView {
				model: new_meno
			}
			app.main.currentView.content.show(create_view)
			return
		memoDelete: (childview) ->
			console.log childview
			messages = "#{childview.model.get('id')} : #{childview.model.get('title')} : を削除してよろしいですか？"
			confirm = window.confirm(messages)
			if confirm
				childview.model.destroy()
			return

	MemoController
