define [
	# 'underscore'
	'marionette'
	# 'views/AppLayoutView'
# ], (Marionette, AppLayoutView) ->
], ( Marionette) ->
	'use strict'
	console.log 'run app.js'

	app = new Marionette.Application()

	ModalRegion = Marionette.Region.extend
		el: '#modal'

		onShow: (view) ->
			view.on 'close', @hideModal, @
			@$el.modal('show')
			return

		hideModal: ->
			@$el.modal('hide')
			return

	app.addRegions
		main:	'#main'
		modal:	ModalRegion

	app.on 'start', ->
		console.log 'run app:start'
		Backbone.history.start()
		return

	app.vent.on 'app:show', (sideView, appView) ->
		app.sidenav.show sideView
		app.content.show appView
		return

	app.vent.on 'modal:show', (view) ->
		console.log view
		console.log app.modal
		app.modal.show(view)
		return

	app.vent.on 'modal:close', ->
		app.modal.hideModal()

	app.addInitializer (options) ->
		# console.log options.routers
		# console.log options.routers.memo
		# console.log options.routers.memo.controller
		_.each options.routers, (router) ->
			console.log 'new router'
			# console.log router
			# console.log router.controller
			c = new router.c()
			r = new router.r({ controller: c})
			# console.log r
			return
		# applayout = new AppLayoutView()
		# app.main.show(applayout)
		# applayout.render()
		return

	app
