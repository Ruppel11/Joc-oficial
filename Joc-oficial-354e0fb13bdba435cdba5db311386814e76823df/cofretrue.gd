extends StaticBody2D

var cofre_abierto:bool = false
var poder_abrir_cofre: bool = false
@onready var so_cofre = $so_cofre

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	abrir_cofre()
	


	
	



func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation=='obert':
		cofre_abierto = true
		dar_llave()


func abrir_cofre():
	if poder_abrir_cofre==true:
		if Input.is_action_just_pressed("Accion"):
			$AnimatedSprite2D.play('obert')
			
			cofre_abierto= true
			poder_abrir_cofre= false
			
func dar_llave():
	if cofre_abierto==true:
		var escenaclau: PackedScene=preload("res://CLAU.tscn")
		var clau = escenaclau.instantiate()
		clau.global_position = global_position
		get_parent().add_child(clau)
		
	else:
		pass


func _on_area_2d_cofre_body_entered(body):
	if body.name=='PERSONATGE PRINCIPAL':
		if cofre_abierto == false:
			poder_abrir_cofre = true
	pass # Replace with function body.


func _on_area_2d_cofre_body_exited(body):
	if body.name=='PERSONATGE PRINCIPAL':
			poder_abrir_cofre=false
	pass # Replace with function body.
