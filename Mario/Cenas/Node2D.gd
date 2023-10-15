extends Area2D




func _on_Node2D_body_entered(body):
	if body is Player:
		body.die()
		Hud.update_hud()
		queue_free()
		$Timer.start()


func _on_Timer_timeout():
	get_tree().reload_current_scene()
