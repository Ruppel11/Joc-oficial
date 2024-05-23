extends Area2D
var agafar_clau:bool=false


# Called when the node enters the scene tree for the first time.
func _ready():
	position=global_position+Vector2(0,100)
	pass # Replace with function body.
	
func agafarclau():
	if agafar_clau== true:
		if Input.is_action_just_pressed('Accion'):
			self.queue_free()
			

	
func _process(delta):
	agafarclau()
	pass
	
	
func _on_body_entered(body):
	if body.name== 'PERSONATGE PRINCIPAL':
		agafar_clau=true
		pass
		
	pass # Replace with function body.


func _on_body_exited(body):
	if body.name== 'PERSONATGE PRINCIPAL':
		agafar_clau=false
		pass
		
	pass # Replace with function body.
