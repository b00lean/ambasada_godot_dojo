extends Node3D
var zavreno = true
func _ready() -> void:
	$"../AnimationPlayer".play("zavreni_dveri")
	zavreno = true
	if zavreno == false:
		$"../AnimationPlayer".play("zavreni_dveri")




func _on_area_3d_body_entered(body: CharacterBody3D) -> void:	
	if zavreno == true:
		$"../AnimationPlayer".play("otevreni_dveri")
		await get_tree().create_timer(7.5).timeout
		zavreno = true
		$"../AnimationPlayer".play("zavreni_dveri")



	


func _on_area_3d_2_body_entered(body: CharacterBody3D) -> void:
	if zavreno == true:
		$"../AnimationPlayer".play("otevreni dveri2")
		await get_tree().create_timer(7.5).timeout
		zavreno = true
		$"../AnimationPlayer".play("zavreni dveri 2")
