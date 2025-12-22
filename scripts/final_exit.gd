extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if (body.items >= 8):
			call_deferred("_go_to_next_scene")
		else:
			body.global_position.x += 30

func _go_to_next_scene():
	get_tree().change_scene_to_file("res://scenes/victory_screen.tscn")
