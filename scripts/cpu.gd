extends "res://scripts/paddle.gd"

var random : RandomNumberGenerator
var ball : Node = null

export(float, 0, 1) var difficulty : float = 0.5

func _ready():
	random = RandomNumberGenerator.new()
	random.randomize()

func process_motion() -> void:
	if sign(position.y - get_viewport().size.y / 4) != sign(ball.linear_velocity.y):
		motion.x = 0
		return
	
	if random.randf_range(0, 1) > difficulty:
		motion.x = 0
		return
	
	var x : float = position.x
	var ball_x : float = ball.position.x
	
	if x < ball_x:
		motion.x = speed
	elif x > ball_x:
		motion.x = -speed
	
