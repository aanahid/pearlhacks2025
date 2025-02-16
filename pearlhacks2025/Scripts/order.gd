extends Control

@onready var flower_slots = [$VBoxContainer/HBoxContainer/TextureRect, $VBoxContainer/HBoxContainer/TextureRect2, $VBoxContainer/HBoxContainer/TextureRect3]
@onready var timer = $Timer
@onready var progress_bar =$VBoxContainer/ProgressBar

var flowers = [
	preload("res://Assets/carnation.png"),
	preload("res://Assets/dahlia.png"),
	preload("res://Assets/freesia.png"),
	preload("res://Assets/rose.png")
]

func _ready():
	if Globals.level == 1: 
		timer.wait_time = 40
		progress_bar.max_value = 40
	progress_bar.value = 0
	await get_tree().create_timer(0.1).timeout
	generate_order()
	timer.start()

func generate_order():
	var flower_count = randi() % 3 + 1  # Generate 1 to 3 flowers
	var selected_flowers = []
	
	for i in range(flower_count):
		var n = randi() % flowers.size()
		selected_flowers.append(flowers[n])
		if n == 0: 
			Globals.order.append("carnation")
		if n == 1: 
			Globals.order.append("dahlia")
		if n == 2: 
			Globals.order.append("freesia")
		if n == 3: 
			Globals.order.append("rose")
		
	set_flowers(selected_flowers)
		

func set_flowers(flower_textures: Array):
	for i in range(flower_slots.size()):
		if i < flower_textures.size():
			flower_slots[i].texture = flower_textures[i]  # Set the image
			flower_slots[i].visible = true
			print("Setting texture for slot ", i)
		else:
			flower_slots[i].visible = false

func _process(delta):
	if timer.is_stopped() == false:
		progress_bar.value = timer.time_left

func _on_timer_timeout() -> void:
	queue_free()
