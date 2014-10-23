define [
	'backbone'
	'models/note'
	'models/tag'
	'collections/tags'
	'backbone-relational-amd'
], (Backbone, Note, Tag, Tags) ->
	'use strict'
	console.log 'run memos'

	Memo = Backbone.RelationalModel.extend
		defaults:
			title: ''
			content: ''
			completed: 0
			display_sort: 0

		urlRoot: '../../data.memo/memos'

		relations: [
			{
			type: Backbone.HasOne
			key: 'note'
			relatedModel: Note
			reverseRelation:
				key: 'memos'
				includeInJSON: false
			},
			{
			type: Backbone.HasMany
			key: 'tags'
			relatedModel: Tag
			collectionType: Tags
			reverseRelation:
				key: 'memos'
				includeInJSON: false
			}
		]
		parse: (response) ->
			result = null
			# console.log 'in memo parse'
			# console.log response
			if response.memos?[0]?
				result = response.memos[0]
			else
				result = response
			# console.log result
			result

	Memo.setup()
