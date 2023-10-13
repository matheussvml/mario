 extends Node

func _ready():
	Hud.visible = false
	$MusicaTema.play()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Cenas/Level.tscn")
		Hud.visible = true
		$MusicaTema.stop()



func _on_Button_pressed():
	Hud.visible = true
	get_tree().change_scene("res://Cenas/Level.tscn")
	$MusicaTema.stop()
