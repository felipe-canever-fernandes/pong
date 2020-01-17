extends RigidBody2D

const INITIAL_SPEED : float = 120.0
var SPEEDUP : float = 10.0

var speed : float = 0.0 setget , get_speed

var random : RandomNumberGenerator

func _ready() -> void:
	random = RandomNumberGenerator.new()
	random.randomize()
	
	var x_direction : int = -1 if random.randi_range(0, 1) == 0 else 1
	var y_direction : int = -1 if random.randi_range(0, 1) == 0 else 1
	
	linear_velocity = INITIAL_SPEED * Vector2(x_direction, y_direction).normalized()

func get_speed() -> float:
	return linear_velocity.length()
