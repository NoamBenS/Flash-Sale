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

var collected_3 := false
var collected_6 := false
var collected_8 := false

func _ready():
	oil.value = max_time
	current_time = max_time
	await _show_three_items()
	timer.start()

func _physics_process(_delta):
	
	if (items == 3 && (not collected_3)):
		collected_3 = true
		_next_room()
	if (items == 6 && (not collected_6)):
		collected_6 = true
		_next_room()
	if (items == 8 && (not collected_8)):
		collected_8 = true
		_gauntlet_text()
	
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
	
func _show_three_items():
	var text := $CanvasLayer/RichTextLabel
	text.visible = true
	await get_tree().create_timer(2.0).timeout  # wait 2 seconds
	text.visible = false

func _show_two_items():
	var text := $CanvasLayer/RichTextLabel2
	text.visible = true
	await get_tree().create_timer(2.0).timeout  # wait 2 seconds
	text.visible = false
	
func _next_room():
	var text := $Canvaslayer/RichTextLabel4
	text.visible = true
	await get_tree().create_timer(2.0).timeout  # wait 2 seconds
	text.visible = false

func _gauntlet_text():
	var text := $CanvasLayer/RichTextLabel3
	text.visible = true
	await get_tree().create_timer(2.0).timeout  # wait 2 seconds
	text.visible = false
