extends CharacterBody2D

const speed = 100

@onready var anim := $"Walk Animations"

var facing := Vector2.DOWN

func _physics_process(_delta):
	
	var direction := Vector2.ZERO

	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		facing = direction

	velocity = direction * speed
	update_animation()
	move_and_slide()
	
func update_animation():
	if velocity == Vector2.ZERO:
		if (facing.y > 0):
			anim.play("idle_down")
		elif (facing.y < 0):
			anim.play("idle_up")
		else:
			if (facing.x > 0):
				anim.play("idle_right")
			elif (facing.x < 0):
				anim.play("idle_left")
		return

	if abs(facing.x) > abs(facing.y):
		if facing.x > 0:
			anim.play("walk_right")
		else:
			anim.play("walk_left")
	else:
		if facing.y > 0:
			anim.play("walk_down")
		else:
			anim.play("walk_up")
	return
