define [
	'marionette'
	'controllers/MemoController'
], (Marionette, MemoController) ->
	'use strict'
	console.log 'run MemoRouter'

	return Marionette.AppRouter.extend
		appRoutes:
			'':				'memoList'
			'home':			'memoList'
			'edit/:id':		'memoForm'
			'create/':		'memoAdd'
			'delete/:id':	'memoDelete'
