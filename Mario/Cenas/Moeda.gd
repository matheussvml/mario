extends Area2D

signal pegou


func _on_Moeda_body_entered(body):
	if body is Player:
		body.pegar_moeda()
		queue_free()
