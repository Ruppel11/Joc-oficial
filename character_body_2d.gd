extends CharacterBody2D

<<<<<<< HEAD
var fantasmas_inattack_range = false
var fantasmas_attack_cooldown = true
var health = 100
var player_alive = true

var num_key = 0
=======

>>>>>>> parent of 354e0fb (8 Cofres amb Claus)
const max_speed = 400.0
const accel = 1500.0
const friction = 600
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var MenuPause : Node2D = $MenuPause
var input = Vector2.ZERO


func _physics_process(delta):
	# Add the gravity.
	animacion()
	fantasmas_attack()
	
	if health <= 0:
		player_alive = false #muerte del personaje
		health = 0
		print("player has been killed")
		self.queue_free()
		get_tree().change_scene_to_file("res://menu_principal.tscn")
		
		

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
		
	if (velocity.x < 0 ) and Input.is_action_just_pressed("atac")==false:
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
	get_tree().paused = false
	MenuPause.visible = get_tree().paused


func player():
	pass


func _on_player_hitbox_area_entered(area):
	if area.is_in_group("fantasmas"):
		fantasmas_inattack_range = true
		


func _on_player_hitbox_area_exited(area):
	if area.is_in_group("fantasmas"):
		fantasmas_inattack_range = false
		
		
func fantasmas_attack():
	if fantasmas_inattack_range and fantasmas_attack_cooldown == true:
		health = health - 20
		fantasmas_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
		


func _on_atack_cooldown_timeout():
	fantasmas_attack_cooldown = true



