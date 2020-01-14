extends Node2D

func _on_Ball_body_entered(body : PhysicsBody2D) -> void:
	if body.is_in_group("PaddlesWalls"):
		if body.name == "TopWall":
			$Enemy.points += 1
		elif body.name == "BottomWall":
			$Player.points += 1
		
		$Ball.reset()
	elif body.is_in_group("Paddles"):
		$Ball.maximum_speed *= 1.05
		$Ball.direction = sign(body.motion.x)
	
	$PointsLabel.text = "%s - %s" % [$Player.points, $Enemy.points]
