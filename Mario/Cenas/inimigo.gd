extends KinematicBody2D

var direcao = 1
var speed = 50
var gravity = 10
var velocity = Vector2()

var speedx = 50

func _physics_process(delta):
	velocity.y += 10
	velocity.x = speedx
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if not $RayCast2D.is_colliding():
		self.scale.x *= -1
		speedx *= -1


func _on_TimerPatrulha_timeout():
	direcao *= -1


func _on_Area2D_body_entered(body):
	if body is Player:
		print(body.is_falling())
		if body.is_falling() and body.global_position.y <= self.global_position.y:
			$Animacao.scale.y -= 0.5 * $Animacao.scale.y
			$Animacao.position.y *= -3
			body.motion.y = body.JUMP_FORCE
			$Timer.start()
			body.pisei()
		else:
			body.damage()
			Hud.update_hud()


func _on_Timer_timeout():
	queue_free()
