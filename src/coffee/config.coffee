'use strict'

require.config
	### main.jsがアプリのスタート地点 ###
	deps: ['main']
	paths:
		jquery:			'../bower_components/jquery/jquery'
		underscore:		'../bower_components/underscore/underscore'
		backbone:		'../bower_components/backbone/backbone'
		'backbone-relational-amd':		'../bower_components/backbone-relational-amd/backbone-relational'
		marionette:		'../bower_components/marionette/lib/backbone.marionette'
		text:			'../bower_components/requirejs-text/text'
		bootstrap:		'../bower_components/bootstrap/dist/js/bootstrap'
		metisMenu:		'../assets/sb-admin-2/js/plugins/metisMenu/metisMenu'
		sb_admin_2:		'../assets/sb-admin-2/js/sb-admin-2'
	shim:
		bootstrap:
			deps: ['jquery']
			exports: 'Bootstrap'
		metisMenu:
			deps: ['bootstrap']
			exports: 'MetisMenu'
		sb_admin_2:
			deps: ['bootstrap', 'metisMenu']
			exports: 'Sb_admin_2'




