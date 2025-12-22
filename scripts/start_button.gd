extends Control

@onready var splash = $Level1Splash

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	await show_splash()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func show_splash():
	splash.visible = true
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	splash.visible = false
	get_tree().paused = false

func _on_exit_pressed() -> void:
	get_tree().quit()
	

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits_screen.tscn")
