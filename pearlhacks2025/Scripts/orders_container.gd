extends Node

@onready var order_scene = preload("res://Scenes/Order.tscn")
@onready var timer = $"../Timer"

func _ready():
	timer.wait_time = 25
	timer.start()
	print("timer started")
	create_new_order()

# Function to create a new order and add it to the container
func create_new_order():
	var new_order = order_scene.instantiate()  # Create an instance of the Order scene
	add_child(new_order)  # Add it as a child to the OrdersContainer node
	print("new order")

func _on_timer_timeout() -> void:
	print("here")
	create_new_order()  # Create and add a new order
	timer.stop()
	timer.start()
