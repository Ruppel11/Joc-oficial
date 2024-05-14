extends CharacterBody2D

var speed = 300
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase:
		velocity = (player.get_global_position() - position).normalized() * speed * delta
		$Sprite0.play("walk")
		if (player.position.x - position.x) < 0:
			$Sprite0.flip_h = false
		else:
			$Sprite0.flip_h = true	
	else:
		velocity = lerp(velocity, Vector2.ZERO, 0.07)
		$Sprite0.play("idle")
	move_and_collide(velocity)
	
		


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true
	

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
