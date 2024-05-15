extends CharacterBody2D

var num_key = 0
const max_speed = 400.0
const accel = 1500.0
const friction = 600
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var MenuPause : Node2D = $MenuPause
var input = Vector2.ZERO


func _physics_process(delta):
	# Add the gravity.
	animacion()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * max_speed
	else:
		velocity.x = move_toward(velocity.x, 0, max_speed)
	var directiony = Input.get_axis("up","down")
	if directiony :
		velocity.y = directiony * max_speed
	else:
		velocity.y = move_toward(velocity.y, 0, max_speed)
	
	move_and_slide()

	
func animacion():
	if Input.is_action_just_pressed("atac"):
		animated_sprite_2d.animation = "ataque"
	
	if (velocity.x < 0 ) and Input.is_action_just_pressed("atac")==false :
		animated_sprite_2d.animation = "esquerra"
		$AnimatedSprite2D.flip_h=false
	if (velocity.x > 0) and Input.is_action_just_pressed("atac")==false:
		animated_sprite_2d.animation = "esquerra"
		$AnimatedSprite2D.flip_h=true
	if (velocity.y < 0) and Input.is_action_just_pressed("atac")==false:
		animated_sprite_2d.animation = "adalt"
		
	if (velocity.y == 0 and velocity.x == 0 and Input.is_action_just_pressed("atac")==false):
		animated_sprite_2d.animation = "quiet"
 # Llama a la función de animación en cada frame
	
	
	
func _on_pause_button_pressed():
	get_tree().paused = true
	MenuPause.visible = get_tree().paused


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_resum_pressed():
	get_tree().paused=false
	MenuPause.visible = get_tree().paused
