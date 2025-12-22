extends CharacterBody2D

const speed = 150

@onready var anim := $"Walk Animations"
@onready var timer := $Timer
@onready var oil := $CanvasLayer/Oil
@onready var light := $PlayerLight

var facing := Vector2.DOWN

@export var max_time := 100  # 100%
@export var current_time := max_time

@export var items := 0 # starting # of items

@export var entered_level_2 := false
@export var entered_level_3 := false

func _ready():
	oil.value = max_time
	current_time = max_time
	timer.start()

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
	

func _on_timer_timeout():
	current_time -= 5 # decrease by 2%/sec
	if current_time <= 0:
		current_time = 0
		timer.stop()
		get_tree().change_scene_to_file("res://scenes/loss_screen.tscn")
	oil.value = current_time
	light.energy = (float(current_time) / max_time) * 2
