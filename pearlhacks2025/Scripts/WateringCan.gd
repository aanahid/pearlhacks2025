extends Area3D

var player_nearby = false

# Called when the player enters the area
func _on_body_entered(body):
	if body.is_in_group("player"):  # Make sure the player is in a "player" group
		player_nearby = true
		print("in can")

# Called when the player exits the area
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		print("exit can")

func _process(delta):
	if player_nearby and Input.is_action_just_pressed("pick_up") and Globals.item == "":
		Globals.pick_up("watering_can")
		$"../../CanvasLayer/Watering Can Icon".visible = true
