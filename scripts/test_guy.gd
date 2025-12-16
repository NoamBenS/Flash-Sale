extends CharacterBody2D #if your player moves

# Reference to the DialogManager node in the scene
@onready var dialog_manager = get_node("/root/YourScene/DialogManager") 
# Replace '/root/YourScene/DialogManager' with the actual path in your scene tree

func _ready():
	# Lines you want the player to say
	var player_lines = [
		"Hello there!",
		"Oh no! The malls closing!",
        "Help me find 8 presents for Channukah!"
	]
	
	# Position where the TextBox should appear (above the player)
	var text_box_position = global_position + Vector2(0, -50)  # adjust Y to move box above player
	
	# Start the dialog
	dialog_manager.start_dialog(text_box_position, player_lines)
