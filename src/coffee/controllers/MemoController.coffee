define [
	'marionette'
	'views/AppLayoutView'
	'views/memo/MemoListView'
	'views/memo/MemoFormView'
	'views/memo/MemoDeleteModalView'
	'models/memo'
	'collections/memos'
	'collections/notes'
	'app'
	'vent'
], (Marionette, AppLayoutView, MemoListView, MemoFormView, MemoDeleteModalView, Memo, Memos, Notes, app, vent) ->
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
			console.log 'run memoAdd()'

			edit_meno = Memos.getInstance().get(id)
			form_view = new MemoFormView {
				model: edit_meno
			}
			app.main.currentView.content.show(form_view)
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
			# console.log childview
			#	削除用のモーダルを作成
			d_modal = new MemoDeleteModalView {model: childview.model}
			#	イベントの購読を設定
			d_modal.on 'memo:destroy', @memoDestroy, @
			#	モーダル表示イベントの発火
			vent.trigger 'modal:show', d_modal
			return

		memoDestroy: (modalView) ->
			# console.log modalView
			#	メモモデルの削除
			modalView.model.destroy()
			#	モーダル非表示イベントの発火
			vent.trigger('modal:close')
			return

	MemoController
