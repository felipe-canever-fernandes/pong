extends "res://scripts/paddle.gd"

var random : RandomNumberGenerator
var ball : Node = null

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()
	
	type = "CPU"

func _process_motion(delta : float) -> void:
	if sign(position.y - get_viewport().size.y / 4) != sign(ball.linear_velocity.y):
		motion.x = lerp(motion.x, 0, 0.1)
		return
	
	var x : float = position.x
	var ball_x : float = ball.position.x
	
	var offset : float = 2 * random.randf_range(-size.y / 2, size.y / 2)
	
	var target : float = ball_x + offset
	
	if x < target:
		motion.x = lerp(motion.x, speed, 0.2)
	elif x > target:
		motion.x = lerp(motion.x, -speed, 0.2)
	
