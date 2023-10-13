extends StaticBody2D

var life = 3

func _on_AreaImpacto_body_entered(body):
	if Global.is_big:
		life -=1
		$Animador.play("bateu")
		$quebrou.play()
		if life == 2:
			Global.score += 1
			Hud.update_hud()
		if life == 0:
			queue_free()
	else:
		$Animador.play("bateu2")
