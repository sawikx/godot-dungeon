extends KinematicBody2D


func _on_met_body_entered(body):
	if body.global_position.y == get_node("met").global_position.y:
		return
	$Panel/restart.text = "reset"
	$Panel.show()
	
	

func _on_restart_pressed():
	get_tree().reload_current_scene()
