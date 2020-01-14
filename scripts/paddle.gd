extends KinematicBody2D

export(int) var speed : int

var points : int = 0
var motion : Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta : float):
	process_motion()
	motion = move_and_slide(motion)

func process_motion() -> void:
	pass
