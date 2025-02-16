extends Area3D

@onready var timer = $"../../../Timer"
@onready var progress_bar = $"../../../Label3D"

var player_nearby = false
var planted_seed = ""
var flower_ready = false
var timer_started = false
var flower_node = null


# Called when the player enters the area
func _on_body_entered(body):
	if body.is_in_group("player"):  # Make sure the player is in a "player" group
		player_nearby = true
		print("in plot")

# Called when the player exits the area
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false
		print("exit plot")

func _process(delta):
	if timer_started:
		$"../../../Label3D".visible = true
		progress_bar.text = str(ceil(timer.time_left))
	if player_nearby and Input.is_action_just_pressed("pick_up"):
		print("flowerpot pickup")
		if Globals.item != "":
			if Globals.item == "watering_can" and planted_seed != "" and !flower_ready:
				timer.wait_time = 10
				timer.start()
				timer_started = true
			else:
				if planted_seed == "":
					if Globals.item == "carnation_seed":
						planted_seed = "carnation_seed"
						$"../../../Grass_02".visible = true
					if Globals.item == "dahlia_seed":
						planted_seed = "dahlia_seed"
						$"../../../Grass_02".visible = true
					if Globals.item == "rose_seed":
						planted_seed = "rose_seed"
						$"../../../Grass_02".visible = true
					if Globals.item == "freesia_seed":
						planted_seed = "freesia_seed"
						$"../../../Grass_02".visible = true
		else:
			if flower_ready:
				if planted_seed == "carnation_seed":
					Globals.pick_up("carnation")
				if planted_seed == "rose_seed":
					Globals.pick_up("rose")
				if planted_seed == "freesia_seed":
					Globals.pick_up("freesia")
				if planted_seed == "dahlia_seed":
					Globals.pick_up("dahlia")
				$"../../../Grass_02".visible = false
				flower_node.visible = false
				planted_seed = ""
				flower_ready = false
				return
		Globals.hide_item()
		print("interacted")
		Globals.pick_up("")
		


func _on_timer_timeout() -> void:
		timer_started = false
		$"../../../Label3D".visible = false
		if planted_seed == "carnation_seed":
			flower_node = $"../../../Flower_Carnation_A_1"
			$"../../../Flower_Carnation_A_1".visible = true
		if planted_seed == "rose_seed":
			flower_node = $"../../../Flower_Rose_A_1"
			$"../../../Flower_Rose_A_1".visible = true
		if planted_seed == "freesia_seed":
			flower_node = $"../../../Flower_Freesia_A_2"
			$"../../../Flower_Freesia_A_2".visible = true
		if planted_seed == "dahlia_seed":
			flower_node = $"../../../Flower_Dahlia_A_1"
			$"../../../Flower_Dahlia_A_1".visible = true
		flower_ready = true
			
