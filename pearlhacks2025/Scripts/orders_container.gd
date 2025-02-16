extends Node

@onready var order_scene = preload("res://Scenes/Order.tscn")
@onready var timer = $"../Timer"
@onready var level_time = $"../../level time"
@onready var progress = $"../ProgressBar"

func _ready():
	level_time.wait_time = 120
	timer.wait_time = 35
	progress.max_value = 120
	progress.value = 0
	timer.start()
	level_time.start()
	print("timer started")
	create_new_order()

# Function to create a new order and add it to the container
func create_new_order():
	var new_order = order_scene.instantiate()  # Create an instance of the Order scene
	var offset = Vector2(200, 0)  # Adjust the offset for each order (modify as necessary)
	new_order.position = offset * get_child_count()
	add_child(new_order)  # Add it as a child to the OrdersContainer node
	print("new order")

func _on_timer_timeout() -> void:
	print("here")
	create_new_order()  # Create and add a new order
	timer.stop()
	timer.start()

func _process(delta):
	if timer.is_stopped() == false:
		progress.value = level_time.time_left

func _on_level_time_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_completed.tscn")
