extends KinematicBody2D

var velocity = Vector2()

var direcao = 1
var speed = 50
var gravity = 30
var hited = false

func _ready():
	set_physics_process(false)

func _physics_process(delta):
#	_apply_gravity()
#
#	if hited:
#		translate(Vector2(speed*direcao*delta, 0)) 
#		move_and_slide(velocity, Vector2.UP)

	velocity.y += gravity
	
	if hited:
		velocity.x = speed*direcao
		velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body is Player:
		body.grow()
		queue_free()

func hited():
	hited = true

func _apply_gravity():
	if not is_on_floor():
		velocity.y += gravity
