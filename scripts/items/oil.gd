extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):  # make sure the colliding body is the player
		body.current_time = 105  # increase oil by 1/3
	else:
		return
	if body.current_time > body.max_time:
		body.current_time = body.max_time
	queue_free()
