define [
	'marionette'
	'views/AppLayoutView'
	'views/memo/MemoListView'
	'views/memo/MemoFormView'
	'views/memo/MemoDeleteModalView'
	'views/memo/MemoSaveModalView'
	'models/memo'
	'collections/memos'
	'collections/notes'
	'collections/tags'
	'app'
	'vent'
], (Marionette, AppLayoutView, MemoListView, MemoFormView, MemoDeleteModalView, MemoSaveModalView, Memo, Memos, Notes, Tags, app, vent) ->
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
			console.log 'run memoForm()'

			edit_memo = Memos.getInstance().get(id)
			# モデルが空かチェック
			unless edit_memo?
				console.log 'edit_memo is null'
				@goList()
				return

			form_view = new MemoFormView {
				model: edit_memo
			}
			app.main.currentView.content.show(form_view)
			form_view.on 'memo:save', @saveMemo, @
			return
		memoAdd: ->
			console.log 'run memoAdd()'
			test = Notes.getInstance()
			new_meno = new Memo()
			create_view = new MemoFormView {
				model: new_meno
			}
			app.main.currentView.content.show(create_view)
			create_view.on 'memo:save', @saveMemo, @
			return
		saveMemo: (args) ->
			console.log 'MemoController.saveMemo()'
			# console.log args
			view = args.view
			model = args.model

			# console.log JSON.stringify(model.toJSON())
			# ui.notes,ui.tagsの各viewは表示が遅れるので、初期化の際にuiへ登録されない。
			view.bindUIElements()

			# console.log view.ui.title.val().trim()
			# console.log view.ui.contents.val().trim()
			# console.log view.ui.note.val()
			# 選択されているタグを取得する
			$tags = view.ui.tags.find('.btn.active')
			# console.log $tags
			# 登録用のTagsコレクションを作成
			tmp_tags = new Tags()
			# 選択されたタグを登録用のタグコレクションへ追加
			$tags.each (index, tag)=>
				# console.log tag
				# console.log $(tag).data('id')
				tmp_tags.add view.tags.get($(tag).data('id'))
				return
			# メモモデルに内容を設定
			model.set
				title: view.ui.title.val().trim()
				content: view.ui.contents.val().trim()
				note_id: view.ui.note.val()
				tags: tmp_tags
			# console.log JSON.stringify(@model.toJSON())
			_self = @
			# 保存処理を実行
			model.save().done( (models, response, options)->
				console.log 'save done'

				# console.log @
				# console.log models
				# console.log response
				# console.log options
				# console.log models.memos[0]

				# 保存終了後に共有のタグコレクションへ追加
				Memos.getInstance().add(model)
				# 保存完了した旨の通知
				s_modal = new MemoSaveModalView()
				vent.trigger 'modal:show', s_modal
				# モーダルを閉じるイベントの購読を登録する
				app.modal.$el.one 'hidden.bs.modal', _self.goList
				return
			).fail( (models, response, options)->
				console.log 'save fail'
				# FIXME:保存が失敗した旨の通知を表示する処理を追加する。
				return
			)
			return
		goList: ->
			console.log 'MemoController.goList()'
			Backbone.history.navigate '#', {trigger: true}
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
