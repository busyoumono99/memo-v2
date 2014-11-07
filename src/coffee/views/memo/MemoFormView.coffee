define [
	'underscore'
	'marionette'
	'app'
	'vent'
	'templates'
	'models/memo'
	'collections/memos'
	'collections/notes'
	'collections/tags'
	'views/memo/MemoFormNotesView'
	'views/memo/MemoFormTagsView'
], (_, Marionette, app, vent, templates, Memo, Memos, Notes, Tags, MemoFormNotesView, MemoFormTagsView) ->
	'use strict'

	console.log 'read MemoFormView'
	# console.log templates

	return Marionette.LayoutView.extend
		className: 'row'
		template: _.template(templates.memo.form)
		regions:
			note_container: '#note-select-container'
			tag_container: '#tag-btn-container'

		ui:
			'note': '.note-select'
			'tags': '.tag-container'
			'title': '#inputTitle'
			'contents': '#inputContent'
		events:
			'click .save-btn': 'onClickSaveBtn'

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

		onClickSaveBtn: ->
			console.log 'MemoFormView.onClickSaveBtn()'
			# console.log JSON.stringify(@model.toJSON())
			# ui.notes,ui.tagsの各viewは表示が遅れるので、初期化の際にuiへ登録されない。
			@bindUIElements()

			# console.log @ui.title.val().trim()
			# console.log @ui.contents.val().trim()
			# console.log @ui.note.val()
			# 選択されているタグを取得する
			$tags = @ui.tags.find('.btn.active')
			# console.log $tags
			# 登録用のTagsコレクションを作成
			tmp_tags = new Tags()
			# 選択されたタグを登録用のタグコレクションへ追加
			$tags.each (index, tag)=>
				# console.log tag
				# console.log $(tag).data('id')
				tmp_tags.add @tags.get($(tag).data('id'))
				return
			# メモモデルに内容を設定
			@model.set
				title: @ui.title.val().trim()
				content: @ui.contents.val().trim()
				note_id: @ui.note.val()
				tags: tmp_tags
			# console.log JSON.stringify(@model.toJSON())

			self_model = @model
			# 保存処理を実行
			self_model.save().done( (models, response, options)->
				console.log 'save done'

				# console.log @
				# console.log models
				# console.log response
				# console.log options
				# console.log models.memos[0]

				# 保存終了後に共有のタグコレクションへ追加
				Memos.getInstance().add(self_model)
				# FIXME:保存完了した旨の通知を表示する処理を追加する。
				return
			).fail( (models, response, options)->
				console.log 'save fail'
				# FIXME:保存が失敗した旨の通知を表示する処理を追加する。
				return
			)

			return
