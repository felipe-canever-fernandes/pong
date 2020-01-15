extends Node2D

export(PackedScene) var Ball : PackedScene
export(Array, PackedScene) var Paddles : Array

var ball : Node
var paddles : Array = []

func _ready() -> void:
	randomize()
	instantiatePaddles()
	instantiateBall()

func _physics_process(delta) -> void:
	var has_scored : bool = false
	
	if ball.position.y < paddles[0].position.y + paddles[0].size.y / 2:
		paddles[1].points += 1
		has_scored = true
	elif ball.position.y > paddles[1].position.y - paddles[0].size.y / 2:
		paddles[0].points += 1
		has_scored = true
	
	if has_scored:
		ball.queue_free()
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
	Paddles.shuffle()
	
	for i in range(2):
		paddles.append(instantiatePaddle(Paddles[i]))
		
	paddles[0].position.x = get_viewport().size.x / 4
	paddles[0].position.y = paddles[0].size.y
	
	paddles[1].position.x = get_viewport().size.x / 4
	paddles[1].position.y = get_viewport().size.y / 2 - paddles[1].size.y

func instantiatePaddle(Paddle : PackedScene) -> Node:
	var paddle : Node = Paddle.instance()
	paddle.add_to_group("Paddles")
	add_child(paddle)
	return paddle

func _on_Ball_body_entered(body : PhysicsBody2D) -> void:
	if body.is_in_group("Paddles"):
		ball.maximum_speed *= 1.05
		ball.direction = sign(body.motion.x)
