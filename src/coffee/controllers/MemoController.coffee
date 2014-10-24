define [
	'marionette'
	'views/AppLayoutView'
	'app'
	'vent'
], (Marionette, AppLayoutView, app, vent) ->
	'use strict'
	console.log 'run MemoController'

	MemoController = Marionette.Controller.extend
		initialize: (options) ->
			console.log 'MemoController.initialize()'
			applayout = new AppLayoutView()
			app.main.show(applayout)
			applayout.render()

		memoList: ->
			console.log 'run memoList()'
			return
		memoForm: (id) ->
			return
		memoAdd: ->
			return
		memoDelete: (id) ->
			return

	MemoController
