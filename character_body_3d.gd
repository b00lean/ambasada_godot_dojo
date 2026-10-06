extends CharacterBody3D






func _physics_process(delta: float):
	if Input.is_key_pressed(KEY_S):
		velocity.z = -1
	elif Input.is_key_pressed(KEY_W):
		velocity.z = +1
	elif Input.is_key_pressed(KEY_D):
		velocity.x = -1
	elif Input.is_key_pressed(KEY_A):
		velocity.x = +1
	else:
		velocity.x = 0
		velocity.z = 0
	move_and_slide()
