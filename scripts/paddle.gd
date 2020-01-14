extends KinematicBody2D

export(int) var speed : int

var points : int = 0
var motion : Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
	elif Input.is_action_pressed("ui_right"):
		motion.x = speed
	else:
		motion.x = 0
	
	motion = move_and_slide(motion)