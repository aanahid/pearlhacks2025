extends Control

func _ready():
	$TextureRect/Label.text = str(Globals.score)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/FlowerShop.tscn")
	
