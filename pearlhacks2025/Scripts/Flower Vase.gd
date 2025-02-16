extends Area3D

var player_nearby = false

# Called when the player enters the area
func _on_body_entered(body):
	if body.is_in_group("player"):  # Make sure the player is in a "player" group
		player_nearby = true
		print("in vase")

# Called when the player exits the area
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		print("exit vase")

func _process(delta):
	if player_nearby and Input.is_action_just_pressed("pick_up") and Globals.item != "":
		print("put flower")
		if Globals.item == "carnation":
			$"../Containers_3/Flower_Carnation_A_1".visible = true
			Globals.placed = "carnation"
		if Globals.item == "dahlia":
			$"../Containers_3/Flower_Dahlia_A_1".visible = true
			Globals.placed = "dahlia"
		if Globals.item == "rose":
			$"../Containers_3/Flower_Rose_A_1".visible = true
			Globals.placed = "rose"
		if Globals.item == "freesia":
			$"../Containers_3/Flower_Freesia_A_2".visible = true
			Globals.placed = "freesia"
		
		var found = false
		for i in Globals.order: 
			if Globals.placed == i: 
				found = true
				Globals.order.erase(i)
				if Globals.order == []:
					Globals.score += 60
					var box = $"../../CanvasLayer/OrdersContainer"
					if box.get_child_count() > 0:
						var first_child = box.get_child(0)
						box.remove_child(first_child)
						first_child.queue_free()
				break
		if !found: 
			Globals.order = []
			Globals.mistakes += 1
			if Globals.mistakes == 1: 
				Globals.score -= 20
			if Globals.mistakes == 2: 
				Globals.score -= 40
			if Globals.mistakes == 3: 
				Globals.score -= 60
				get_tree().change_scene_to_file("res://Scenes/level_failed.tscn")
			var box = $"../../CanvasLayer/OrdersContainer"
			if box.get_child_count() > 0:
				var first_child = box.get_child(0)
				box.remove_child(first_child)
				first_child.queue_free()
				
		$"../../CanvasLayer/Score".text = str(Globals.score)
		
		Globals.hide_item()
