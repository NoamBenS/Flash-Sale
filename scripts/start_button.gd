extends Control

@onready var splash = $Level1Splash
@onready var video_player := $IntroVideo
@onready var skip_label := $SkipLabel

var skipping := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	video_player.play()
	skip_label.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if skipping:
		return
	# Skip input
	if Input.is_action_just_pressed("skip"):
		skipping = true
		end_video()

	# Video finished
	if not video_player.is_playing() and not skipping:
		skipping = true
		end_video()

func end_video():
	video_player.stop()
	skip_label.visible = false


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
