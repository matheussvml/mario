extends Area2D

signal pegou


func _on_Moeda_body_entered(body):
	if body is Player:
		Global.score += 1
		Hud.update_hud()
		queue_free()
	
