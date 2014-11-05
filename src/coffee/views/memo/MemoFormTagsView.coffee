define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoFormTagsView'

	return Marionette.ItemView.extend
		collectionEvents: {
			"add": "render"
		}
		template: _.template(templates.memo.form_tags)
		# className: 'col-sm-10 tag-container'
		serializeData: ->
			return {
				items: @collection.toJSON()
			}

