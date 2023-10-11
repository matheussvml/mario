extends StaticBody2D

var life = 1
var hited = false



func _on_AreaImpacto_body_entered(body):
	if body is Player:
		life -=1
		if life == 0:
			$AnimationPlayer.play("bater")
			$Sprite.play("nada")
			$AreaImpacto/CollisionShape2D.disabled = true
			$cogumelo.hited()
