extends KinematicBody2D
class_name Player

export var gravity = 30
var motion = Vector2()
var UP = Vector2(0, -1) 
const MAXVELOCITY = 250
const ACCELERATION = 30
export var JUMP_FORCE = -680
var jump = false 
export var velocity = Vector2()
export var can_double_jump = true
export var coins = 0

var current_animation_index = 0

var invencivel = false

signal morreu

var animations = [
	["walk","idle", "jump", "fall"],
	["walk_big","idle_big",  "jump_big", "fall_big"]
]

var current_animation = 0

func _ready():
	if Global.is_big:
		$Animacao.position.y -= 8
		current_animation_index = 1
	
func _physics_process(delta):
		motion.y += gravity
	
		if Input.is_action_pressed("ui_right"):
			motion.x = min(motion.x+ACCELERATION, MAXVELOCITY)
			$Animacao.flip_h = false
			$Animacao.play(animations[current_animation_index][0])
		elif Input.is_action_pressed("ui_left"):
			motion.x = max(motion.x-ACCELERATION, -MAXVELOCITY)
			$Animacao.flip_h = true
			$Animacao.play(animations[current_animation_index][0])
		else:
			motion.x = lerp(motion.x, 0, 0.2)
			$Animacao.play(animations[current_animation_index][1])
		
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			motion.y = JUMP_FORCE
			$AudioPulo.play()
	
		if Input.is_action_just_pressed("ui_down"):
			self.z_index = 0
			#set_physics_process(false)
			#$AnimationPlayer.play("GoingDownPipe")
			#$PowerDown.play()
			#emit_signal("entered_pipe")
	
		if not is_on_floor():
			if motion.y < 0:
				$Animacao.play(animations[current_animation_index][2])
			
			else:
				$Animacao.play(animations[current_animation_index][3])
			motion.x = lerp(motion.x, 0, 0.05)
	
	
	
		motion = move_and_slide(motion, UP)
	
	




func _on_Notificador_screen_exited():
	emit_signal("morreu")

func grow():
	if not Global.is_big:
		$Animacao.position.y -= 8
		current_animation_index = 1
		Global.is_big = true
		$powerUP.play()

func damage():
	if Global.is_big:
		current_animation_index = 0
		$Animacao.position.y += 8
		$Colisao.scale.y = 1
		self.position.y += 8
		Global.is_big = false
		invencivel = true
		$AnimationPlayer.play("invencivel")
		$powerDown.play()
		$Invencivel.start()
	else:
		die()
	

func break_block():
	$BreakBlock.play()

func pisei():
	$pisei.play()

func pegar_moeda():
	Global.score += 1
	Hud.update_hud()
	$PegarMoeda.play()


func winner():
	$AudioTema.stop()
	$AudioVenceu.play()
	if Global.is_big:
		$AnimationPlayer.play("venceu_big")
	else:
		$AnimationPlayer.play("venceu")


func volta():
	position.x = 201
	position.y = 346

func is_falling():
#	if self.invencivel: return false
	return motion.y > 0
	
func die():
	if not invencivel:
		emit_signal("morreu")
		$AnimationPlayer.play("morte")
		$Timer.start()
		$Animacao.position.y = 0
		$Colisao.position.y = 190
		$AudioTema.stop()
		$morte.play()

func morte():
	$AnimationPlayer.play("morte")

func _on_Timer_timeout():
	Global.vidas -= 1
	Hud.update_hud()
	if Global.vidas > 0:
		Global.is_big = false
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene("res://Cenas/GameOver.tscn")
		
func _on_Invencivel_timeout():
	invencivel = false
