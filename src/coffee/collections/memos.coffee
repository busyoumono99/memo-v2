define [
	'backbone'
	'models/memo'
], (Backbone, Memo) ->
	'use strict'
	console.log 'run memos'

	Memos = Backbone.Collection.extend
		model: Memo
		url: '../../data.memo/memos'
		parse: (response)->
			console.log 'in Memos.parse()'
			console.log response
			if response.memos?
				return response.memos
			response

	Memos.instance = null
	Memos.getInstance = ->
		if !Memos.instance?
			istc = new @()
			Memos.instance = istc
			Memos.instance.fetch()
		Memos.instance

	return Memos
