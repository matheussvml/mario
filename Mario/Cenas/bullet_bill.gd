extends KinematicBody2D


func level1():
	$AnimationPlayer.play("level1")


func _on_Area2D2_body_entered(body):
	if body is Player:
		if body.is_falling() and body.global_position.y <= self.global_position.y:
			body.pisei()
			$AnimationPlayer.play("morreu")
			body.motion.y = body.JUMP_FORCE
		else:
			body.damage()


#func _on_Area2D2_body_entered(body):
#	if body is Player:
#		body.damage()
