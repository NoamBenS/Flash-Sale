extends Control

@onready var splash := $Level1Splash

func _on_mainmenubutton_pressed():
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")

func _on_replaybutton_pressed():
	show_splash()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func show_splash():
	splash.visible = true
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	splash.visible = false
	get_tree().paused = false
