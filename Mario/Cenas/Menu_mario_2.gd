extends Node2D


func _ready():
	$MenuPlayer.menu2()
	Hud.visible = false
	$AnimationPlayer.play("dialogo")
	$MusicaFundo.play()


func _on_Button_pressed():
	get_tree().change_scene("res://Cenas/Level.tscn")
	$MusicaFundo.stop()
	Hud.visible = true
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$MusicaFundo.stop()
		get_tree().change_scene("res://Cenas/Level.tscn")
		Hud.visible = true
