extends Node

func _ready():
	Hud.visible = false

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Cenas/Level.tscn")
		Hud.visible = true



func _on_Button_pressed():
	Hud.visible = true
	get_tree().change_scene("res://Cenas/Level.tscn")
