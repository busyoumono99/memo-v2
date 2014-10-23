'use strict'

console.log 'run main.js'

define [
	# Libraries
	'jquery'
	'underscore'
	'backbone'
	'bootstrap'
	'metisMenu'
	'sb_admin_2'
	# Main App Object
	'app'
	# Application routers
	'routers/MemoRouter'
	'controllers/MemoController'
], ($, _, Backbone, bootstrap, metisMenu, sb_admin_2, app, MemoRouter, MemoController) ->
	options =
		routers:
			memo:
				r: MemoRouter
				c: MemoController
	app.start(options)


	return


