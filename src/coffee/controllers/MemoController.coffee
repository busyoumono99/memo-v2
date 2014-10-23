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
			applayout = new AppLayoutView()
			app.main.show(applayout)
			applayout.render()

		memoList: ->
			console.log 'run memoList()'
			@initialize()
			return
		memoForm: (id) ->
			return
		memoAdd: ->
			return
		memoDelete: (id) ->
			return

	MemoController
