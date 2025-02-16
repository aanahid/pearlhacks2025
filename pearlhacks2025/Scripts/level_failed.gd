extends Control

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_try_again_pressed() -> void:
	Globals.reset_globals()
	get_tree().change_scene_to_file("res://scenes/FlowerShop.tscn")
