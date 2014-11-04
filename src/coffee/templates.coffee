define (require) ->
	return {
		applayout:		require 'text!templates/appLayout.html'
		side:
			note:		require 'text!templates/side/note.html'
			note_list:	require 'text!templates/side/note_list.html'
			sidebar:	require 'text!templates/side/sidebar.html'
			tag:		require 'text!templates/side/tag.html'
			tag_list:	require 'text!templates/side/tag_list.html'
		memo:
			memo:		require 'text!templates/memo/memo.html'
			memo_list:	require 'text!templates/memo/memo_list.html'
			form:		require 'text!templates/memo/form.html'
			form_notes:	require 'text!templates/memo/form_notes.html'
	}
