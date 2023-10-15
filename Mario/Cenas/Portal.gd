extends Node2D


func reinicia_posicao():
	$Player.position = Vector2(0, 0)
	
	
func _on_Player_morreu():
	reinicia_posicao()
	
	

func SubirDescer():
	$AnimationPlayer.play("SubirDescer")

func _on_Portal_body_entered(body):
	if body is Player:
		$Timer.start()
		body.winner()
#		Global.level += 1
#		get_tree().change_scene("res://cenas/Level" + str(Global.level) + ".tscn")


func _on_Moeda_pegou_moeda():
	$Player.coins += 1


func _on_Timer_timeout():
	Global.level += 1
	get_tree().change_scene("res://cenas/Level" + str(Global.level) + ".tscn")
