extends Control

func _on_mainmenubutton_pressed():
	get_tree().change_scene_to_file("res://scenes/start_screen.tscn")

func _on_replaybutton_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")
