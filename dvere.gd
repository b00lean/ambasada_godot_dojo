extends Node3D
var zavreno = true
func _ready() -> void:
	zavreno = true
	if zavreno == true:
		$"../AnimationPlayer".play("zavreni_dveri")
