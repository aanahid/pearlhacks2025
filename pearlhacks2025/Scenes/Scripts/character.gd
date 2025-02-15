extends CharacterBody3D

@export var speed: float = 2.0
@export var acceleration: float = 5.0
@export var friction: float = 5.0
@export var rotation_speed: float = 10.0  # Speed of rotation smoothing
@onready var animator = $"character-female-b2/AnimationPlayer"  # Adjust this path based on your node structure
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
		# Rotate character to face movement direction
		var target_rotation = Quaternion(Basis.looking_at(-input_dir, Vector3.UP))
		var current_rotation = Quaternion(basis)
		basis = Basis(current_rotation.slerp(target_rotation, rotation_speed * delta))
		
		if animator and animator.current_animation != "walk":
			animator.play("walk")
	else:
		velocity = velocity.lerp(Vector3.ZERO, friction * delta)
		if animator and animator.current_animation != "idle":
			animator.play("idle")

	move_and_slide()
