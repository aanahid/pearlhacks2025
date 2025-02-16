extends Node

var item: String = ""
var level: int = 1
var placed: String = ""
var order: Array = []
var mistakes: int = 0
var score: int = 0

@onready var seed_ui = null  # Store reference to UI

func _ready():
	# Find the TextureRect in the UI scene
	var canvas_layer = get_tree().current_scene.find_child("CanvasLayer", true, false)
	#if canvas_layer:
		#seed_ui = canvas_layer.get_children(false)

func hide_item():
	var canvas_layer = get_tree().current_scene.find_child("CanvasLayer", true, false)
	if Globals.item == "carnation_seed":
		seed_ui = canvas_layer.find_child("carnation", true, false)
	if Globals.item == "dahlia_seed":
		seed_ui = canvas_layer.find_child("dahlia", true, false)
	if Globals.item == "rose_seed":
		seed_ui = canvas_layer.find_child("rose", true, false)
	if Globals.item == "freesia_seed":
		seed_ui = canvas_layer.find_child("freesia", true, false)
	if Globals.item == "watering_can":
		seed_ui = canvas_layer.find_child("Watering Can Icon", true, false)
	if Globals.item == "carnation":
		seed_ui = canvas_layer.find_child("carnation2", true, false)
	if Globals.item == "dahlia":
		seed_ui = canvas_layer.find_child("dahlia2", true, false)
	if Globals.item == "rose":
		seed_ui = canvas_layer.find_child("rose2", true, false)
	if Globals.item == "freesia":
		seed_ui = canvas_layer.find_child("freesia2", true, false) 
	seed_ui.visible = false
	Globals.item = ""

func pick_up(item1: String):
	print("pickup")
	var canvas_layer = get_tree().current_scene.find_child("CanvasLayer", true, false)
	item = item1
	if item == "carnation":
		seed_ui = canvas_layer.find_child("carnation2", true, false)
		seed_ui.visible = true
	if item == "dahlia":
		seed_ui = canvas_layer.find_child("dahlia2", true, false)
		seed_ui.visible = true
	if item == "rose":
		seed_ui = canvas_layer.find_child("rose2", true, false)
		seed_ui.visible = true
	if item == "freesia":
		seed_ui = canvas_layer.find_child("freesia2", true, false)
		seed_ui.visible = true

func reset_stats(): 
	item = ""
	placed = ""
	order = []
	mistakes = 0
	score = 0
