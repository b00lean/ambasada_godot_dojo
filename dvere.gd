extends Node3D
var zavreno = true
func _ready() -> void:
	zavreno = true
	if zavreno == false:
		$"../AnimationPlayer".play("zavreni_dveri")
	




func _on_pevne_dvere_mouse_entered() -> void:
	if zavreno == true:
		zavreno = false
		$"../AnimationPlayer".play("otevreni_dveri")
	elif zavreno == false:
		$"../AnimationPlayer".play("zavreni_dveri")
		zavreno = true
