extends CharacterBody3D

@export var speed: float = 5.0
@export var acceleration: float = 10.0
@export var friction: float = 5.0

func _physics_process(delta: float) -> void:
	var input_dir = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		input_dir.z -= 1
	if Input.is_action_pressed("move_backward"):
		input_dir.z += 1
	if Input.is_action_pressed("move_left"):
		input_dir.x -= 1
	if Input.is_action_pressed("move_right"):
		input_dir.x += 1
	
	input_dir = input_dir.normalized()  # Prevent diagonal movement from being too fast

	if input_dir != Vector3.ZERO:
		velocity = velocity.lerp(input_dir * speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector3.ZERO, friction * delta)

	move_and_slide()
