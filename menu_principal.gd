extends Control

@onready var Jugar = $MarginContainer/HBoxContainer/VBoxContainer/Jugar as Button
@onready var Sortir = $MarginContainer/HBoxContainer/VBoxContainer/Sortir as Button
@onready var Mapa = $MarginContainer/HBoxContainer/VBoxContainer/mapa as Button
@onready var start_level = preload('res://main_scene.tscn') as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	Jugar.button_down.connect(on_start_pressed)
	Sortir.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_exit_pressed() -> void:
	get_tree().quit()
