extends Node2D


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_accept'):
		get_tree().paused = not get_tree().paused
