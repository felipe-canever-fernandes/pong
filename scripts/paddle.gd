extends KinematicBody2D

export(int) var speed : int

var type : String = ""

var points : int = 0 setget set_points
var motion : Vector2 = Vector2.ZERO

var size : Vector2 setget , get_size

func _physics_process(delta : float):
	process_motion()
	motion = move_and_slide(motion)

func process_motion() -> void:
	pass

func set_points(value : int):
	points = value
	$PointsLabel.text = str(points)

func get_size() -> Vector2:
	return $Sprite.texture.get_size()
