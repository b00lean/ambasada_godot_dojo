extends Node3D

@export var mouse_sensitivity: float = 0.003
@export var min_pitch: float = -60.0
@export var max_pitch: float = 30.0

@onready var player: CharacterBody3D = get_parent() as CharacterBody3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Rotate the player left and right
		player.rotation.y -= event.relative.x * mouse_sensitivity

		# Rotate the camera up and down
		rotation.x -= event.relative.y * mouse_sensitivity
		rotation.x = clampf(
			rotation.x,
			deg_to_rad(min_pitch),
			deg_to_rad(max_pitch)
		)

	# Press Escape to release the mouse
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	# Click to capture the mouse again
	if event is InputEventMouseButton and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
