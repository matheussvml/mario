 extends Node

func _ready():
	Hud.visible = false
	$MusicaTema.play()
	$MenuPlayer.menu3()
	#$AnimationPlayer.play("menuzin")
	$Timer.start()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Cenas/Menu_mario_2.tscn")
		Hud.visible = true
		$MusicaTema.stop()



func _on_Button_pressed():
	Hud.visible = true
	get_tree().change_scene("res://Cenas/Menu_mario_2.tscn")
	$MusicaTema.stop()


func _on_Timer_timeout():
	$ParallaxBackground/ParallaxLayer/LuckyBlock/AnimationPlayer.play("bater_menu")
	#$MenuPlayer/AnimationPlayer.play("RESET")
