extends Node2D

export(PackedScene) var Ball : PackedScene
export(Array, PackedScene) var Paddles : Array

var ball : Node
var paddles : Array = []

func _ready() -> void:
	randomize()
	instantiatePaddles()
	instantiateBall()

func instantiateBall() -> void:
	ball = Ball.instance()
	
	for paddle in paddles:
		if paddle.type == "CPU":
			paddle.ball = ball
	
	ball.position = get_viewport().size / 4
	ball.connect("body_entered", self, "_on_Ball_body_entered")
	
	add_child(ball)

func instantiatePaddles() -> void:
	var paddles_positions : Array = [
		Vector2(get_viewport().size.x / 4, 8),
		Vector2(get_viewport().size.x / 4, get_viewport().size.y / 2 - 8)]
		
	paddles_positions.shuffle()
	
	for i in range(2):
		paddles.append(instantiatePaddle(Paddles[i]))
		paddles[i].position = paddles_positions[i]
		
		if paddles[i].type == "CPU":
			paddles

func instantiatePaddle(Paddle : PackedScene) -> Node:
	var paddle : Node = Paddle.instance()
	paddle.add_to_group("Paddles")
	add_child(paddle)
	return paddle

func _on_Ball_body_entered(body : PhysicsBody2D) -> void:
	if body.is_in_group("PaddlesWalls"):
		if body.name == "TopWall":
			paddles[1].points += 1
		elif body.name == "BottomWall":
			paddles[0].points += 1
		
		ball.queue_free()
		instantiateBall()
		
		$PointsLabel.text = "%s - %s" % [paddles[0].points, paddles[1].points]
	elif body.is_in_group("Paddles"):
		ball.maximum_speed *= 1.05
		ball.direction = sign(body.motion.x)
