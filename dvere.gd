extends Node3D
var zavreno = true
func _ready() -> void:
	zavreno = true
	if zavreno == false:
		$"../AnimationPlayer".play("zavreni_dveri")
	




func _on_area_3d_body_entered(body: CharacterBody3D) -> void:
		if zavreno == true:
			zavreno = false
			$"../AnimationPlayer".play("otevreni_dveri")
			await get_tree().create_timer(5).timeout
		elif zavreno == false:
			$"../AnimationPlayer".play("zavreni_dveri")
			zavreno = true
			await get_tree().create_timer(5).timeout


	
