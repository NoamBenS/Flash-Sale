extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 256

var text = ""
var letter_index = 0
var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.02

signal finished_displaying()

func display_text(text_to_display: String):
	text = text_to_display
	letter_index = 0
	label.text = ""
	_display_next_letter()

func _display_next_letter():
	if letter_index >= text.length():
		finished_displaying.emit()
		return

	label.text += text[letter_index]

	var wait_time = letter_time
	match text[letter_index]:
		"!", ".", ",", "?":
			wait_time = punctuation_time
		" ":
			wait_time = space_time

	letter_index += 1
	timer.start(wait_time)

func _on_letter_display_timer_timeout():
	_display_next_letter()
