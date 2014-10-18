define [
	'backbone'
	'models/memo'
], (Backbone, Memo) ->
	'use strict'

	Memos = Backbone.Collection.extend
		model: Memo
		url: '../../data.memo/memos'
		parse: (response)->
			console.log 'in Memos.parse()'
			console.log response
			if response.memos?
				return response.memos
			response

	Memos