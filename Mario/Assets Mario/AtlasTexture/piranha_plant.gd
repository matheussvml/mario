extends KinematicBody2D


func _ready():
	$AnimationPlayer.play("piranha")



func _on_Area2D_body_entered(body):
	if body is Player:
		body.damage()

