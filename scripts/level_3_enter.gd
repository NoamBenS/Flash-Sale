extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if (body.items >= 6):
			if (body.entered_level_3 == false):
				body.entered_level_3 = true
			body.global_position.x = 3400
			get_tree().change_scene_to_file("res://scenes/level_3.tscn")
