define [
	'underscore'
	'marionette'
	'templates'
	'app'
], (_, Marionette, templates, app) ->
	'use strict'
	console.log 'read MemoSaveModalView'

	return Marionette.ItemView.extend
		template: _.template(templates.memo.save_modal)
		onShow: ->
			# イベントの購読を登録。jqueyのoneメソッド
			app.modal.$el.one 'hidden.bs.modal', (e)=>
				# console.log 'hidden.bs.modal'
				@trigger 'memo:go_list'
