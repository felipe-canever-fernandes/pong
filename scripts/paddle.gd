extends KinematicBody2D

export(int) var speed : int

var type : String = ""

var points : int = 0 setget set_points
var motion : Vector2 = Vector2.ZERO

var size : Vector2 setget , get_size

enum Placement {NONE = 0, TOP = -1, BOTTOM = 1}
var placement : int = Placement.NONE

var anchor : Vector2 = Vector2.ZERO setget , get_anchor

func get_anchor() -> Vector2:
	var x : float = position.x
	var y : float = position.y + ((size.x / 2) / tan(PI / 4)) * placement
	
	return Vector2(x, y)

func _physics_process(delta : float):
	_process_motion(delta)
	motion = move_and_slide(motion)

func _process_motion(delta : float) -> void:
	pass

func set_points(value : int):
	points = value
	$PointsLabel.text = str(points)

func get_size() -> Vector2:
	return $Sprite.texture.get_size()
