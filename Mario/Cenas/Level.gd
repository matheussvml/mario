extends Node2D


func _ready():
	$AudioTema.play()
	$Portal.SubirDescer()

func _on_Portal_body_entered(body):
	if body is Player:
		$AudioTema.stop()
