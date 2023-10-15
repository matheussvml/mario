extends Node2D

func _ready():
	Hud.visible = false
	Global.reset()
	$gameover.play()
	$AnimationPlayer.play("gameover")

func _on_gameover_finished():
	Hud.visible = true
	get_tree().change_scene("res://Cenas/Menu.tscn")

