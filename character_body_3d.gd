extends CharacterBody3D

@export var speed: float = 5.0

func _physics_process(_delta: float) -> void:
	var input_dir := Vector2.ZERO

	# WASD
	if Input.is_key_pressed(KEY_A):
		input_dir.x -= 1.0
	if Input.is_key_pressed(KEY_D):
		input_dir.x += 1.0
	if Input.is_key_pressed(KEY_W):
		input_dir.y -= 1.0
	if Input.is_key_pressed(KEY_S):
		input_dir.y += 1.0

	input_dir = input_dir.normalized()

	# Movement relative to the character's rotation
	var direction := global_transform.basis * Vector3(
		input_dir.x, 0.0, input_dir.y
	)

	# Reverse direction to match your character model
	direction = -direction
	direction.y = 0.0
	direction = direction.normalized()

	if input_dir != Vector2.ZERO:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0.0, speed)
		velocity.z = move_toward(velocity.z, 0.0, speed)

	# No gravity
	velocity.y = 0.0

	move_and_slide()
