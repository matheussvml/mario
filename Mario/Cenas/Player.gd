extends KinematicBody2D
class_name Player

export var gravity = 5
export var walk_speed = 150
export var jump_force = -50
export var velocity = Vector2()
export var can_double_jump = true
export var coins = 0

var invencivel = false

signal morreu

var animations = [
	["idle", "walk", "jump"],
	["idle_big", "walk_big", "jump_big"]
]

var current_animation = 0

func _ready():
	if Global.is_big:
		grow()
	
	
func _physics_process(delta):
	var mov_horizontal = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = mov_horizontal * walk_speed
	velocity.y += gravity
	if is_on_floor():
		if abs(velocity.x) > 0:
			$Animacao.play(animations[current_animation][1])
		else:
			$Animacao.play(animations[current_animation][0])
	else:
		$Animacao.play(animations[current_animation][2])
	if velocity.x > 0:
		$Animacao.flip_h = false
	elif velocity.x < 0:
		$Animacao.flip_h = true
	
	if is_on_ceiling():
		velocity.y = 0
	if is_on_floor():
		can_double_jump = true
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
	elif can_double_jump and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force
		can_double_jump = false
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Notificador_screen_exited():
	emit_signal("morreu")

func grow():
	current_animation = 1
	$Colisao.scale.y = 1.4
	Global.is_big = true

func damage():
	if not invencivel:
		current_animation = 0
		$Colisao.scale.y = 1
		self.position.y += 8
		Global.is_big = false
		invencivel = true
		$Invencivel.start()
	
func volta():
	position.x = 201
	position.y = 346

func is_falling():
#	if self.invencivel: return false
	return velocity.y > 0
	
func die():
	$AnimationPlayer.play("morte")
	$Timer.start()
	$Animacao.position.y = 0
	$Colisao.position.y = 190

func _on_Timer_timeout():
	get_tree().reload_current_scene()


func _on_Invencivel_timeout():
	invencivel = false
