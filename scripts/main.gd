extends Node2D

export(PackedScene) var Ball : PackedScene
var ball : Node

func _ready() -> void:
	instantiateBall()

func instantiateBall() -> void:
	ball = Ball.instance()
	
	ball.position = get_viewport().size / 4
	ball.connect("body_entered", self, "_on_Ball_body_entered")
	
	add_child(ball)

func _on_Ball_body_entered(body : PhysicsBody2D) -> void:
	if body.is_in_group("PaddlesWalls"):
		if body.name == "TopWall":
			print("TODO: Update enemy points.")
			#$Enemy.points += 1
		elif body.name == "BottomWall":
			$Player.points += 1
		
		ball.queue_free()
		instantiateBall()
		
		print("TODO: Update points label.")
		#$PointsLabel.text = "%s - %s" % [$Player.points, $Enemy.points]
	elif body.is_in_group("Paddles"):
		ball.maximum_speed *= 1.05
		ball.direction = sign(body.motion.x)
