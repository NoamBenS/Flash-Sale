extends Node

@export var dialog_manager: Node # Drag your DialogManager node in the editor

func _ready():
	# Instantiate the player
	var player_instance = preload("res://scenes/character/player.tscn").instantiate()
	add_child(player_instance)

	# Disable darkness and health bar for this scene only
	player_instance.enable_darkness = false
	if player_instance.has_node("PlayerLight"):
		player_instance.get_node("PlayerLight").visible = false
	if player_instance.has_node("HealthBar"):
		player_instance.get_node("HealthBar").visible = false

	# Start dialog
	var dialog_manager_script = dialog_manager as DialogManager
	if dialog_manager_script != null:
		var lines = [
			"Hello there, adventurer!",
			"Welcome to our village.",
			"Be careful, monsters lurk nearby..."
		]
		dialog_manager_script.start_dialog(Vector2(248, 208), lines)
