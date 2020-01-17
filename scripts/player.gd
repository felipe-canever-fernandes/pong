extends "res://scripts/paddle.gd"

func _ready():
	type = "Player"

func _process_motion(delta : float) -> void:
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0
