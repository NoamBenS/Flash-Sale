extends Area2D

var entered := false
@onready var splash := $Level2Splash

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	if (body.is_in_group("Player")):
		if (body.items >= 3):
			if not entered:
				entered = true
				show_splash()
			body.global_position.x = 1600
		else:
			body.global_position.x -= 30

func show_splash():
	splash.visible = true
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	splash.visible = false
	get_tree().paused = false
