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
		if Globals.item == "dahlia":
			$"../Containers_3/Flower_Dahlia_A_1".visible = true
		if Globals.item == "rose":
			$"../Containers_3/Flower_Rose_A_1".visible = true
		if Globals.item == "freesia":
			$"../Containers_3/Flower_Freesia_A_2".visible = true
		Globals.hide_item()
