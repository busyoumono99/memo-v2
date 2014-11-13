define [
	'underscore'
	'marionette'
	'templates'
], (_, Marionette, templates) ->
	'use strict'
	console.log 'read MemoFormTagsView'

	return Marionette.ItemView.extend
		initialize: (attributes, options) ->
			@options = options
			# console.log Marionette.getOption(@, 'form_model')
			# console.log Marionette.getOption(@, 'form_model').get('tags')
			return

		collectionEvents: {
			"add": "render"
		}
		template: _.template(templates.memo.form_tags)
		# className: 'col-sm-10 tag-container'
		serializeData: ->
			# console.log 'MemoFormTagsView.serializeData()'
			belong_tags = Marionette.getOption(@, 'form_model').get('tags')
			belong_tags.each((element, index, array) =>
				# console.log element
				# console.log index
				# console.log array
				# console.log @collection.toJSON()
				belong_id = element.get('id')
				tag = @collection.find( (tmp_tag) =>
					# console.log tmp_tag
					return tmp_tag.get('id') == belong_id
				)
				# console.log belong_id
				# console.log tag?.get('id')
				tag?.set('selected', true)
				return
			)
			# console.log @collection.toJSON()
			return {
				items: @collection.toJSON()
			}

