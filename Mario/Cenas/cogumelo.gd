extends KinematicBody2D

export var velocity = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity.y += 10
	velocity.x = 50
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body is Player:
		body.grow()
		queue_free()
