extends StaticBody2D

var life = 3

func _on_AreaImpacto_body_entered(body):
	life -=1
	Global.score += 1
	Hud.update_hud()
	$Animador.play("bateu")
	if life == 0:
		queue_free()
