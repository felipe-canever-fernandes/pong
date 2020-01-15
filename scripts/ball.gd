extends RigidBody2D

export(float) var initial_speed : float
var maximum_speed : float

var direction : int setget set_direction, get_direction
var angle : float setget set_angle, get_angle

var random : RandomNumberGenerator

func _ready() -> void:
	random = RandomNumberGenerator.new()
	random.randomize()
	
	maximum_speed = initial_speed
	
	var x_direction : int = -1 if random.randi_range(0, 1) == 0 else 1
	var y_direction : int = -1 if random.randi_range(0, 1) == 0 else 1
	
	linear_velocity = maximum_speed * Vector2(x_direction, y_direction)

func _physics_process(delta : float) -> void:
	var normalized : Vector2 = linear_velocity.normalized()	
	linear_velocity = maximum_speed * normalized

func set_direction(value : int) -> void:
	if sign(value) == sign(linear_velocity.x) or value == 0:
		return
	
	linear_velocity.x *= -1

func get_direction() -> int:
	return int(sign(linear_velocity.x))

func set_angle(value : float) -> void:
	linear_velocity.x = maximum_speed * cos(value)
	linear_velocity.y = maximum_speed * sin(value)

func get_angle() -> float:
	return linear_velocity.angle()
