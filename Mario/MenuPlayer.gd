extends KinematicBody2D


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
	
		if Input.is_action_pressed("d"):
			motion.x = min(motion.x+ACCELERATION, MAXVELOCITY)
			$Animacao.flip_h = false
			$Animacao.play(animations[current_animation_index][0])
		elif Input.is_action_pressed("a"):
			motion.x = max(motion.x-ACCELERATION, -MAXVELOCITY)
			$Animacao.flip_h = true
			$Animacao.play(animations[current_animation_index][0])
		else:
			motion.x = lerp(motion.x, 0, 0.2)
			$Animacao.play(animations[current_animation_index][1])
		
		if Input.is_action_just_pressed("w") and is_on_floor():
			motion.y = JUMP_FORCE
			$AudioPulo.play()
	
		if Input.is_action_just_pressed("s"):
			self.z_index = 0
			set_physics_process(false)
			$AnimationPlayer.play("GoingDownPipe")
			$PowerDown.play()
			emit_signal("entered_pipe")
	
		if not is_on_floor():
			if motion.y < 0:
				$Animacao.play(animations[current_animation_index][2])
			
			else:
				$Animacao.play(animations[current_animation_index][3])
			motion.x = lerp(motion.x, 0, 0.05)
	
	
	
		motion = move_and_slide(motion, UP)
	

func menu():
	$AnimationPlayer.play("menu")

func menu2():
	$AnimationPlayer.play("sozinho")

func menu3():
	$AnimationPlayer.play("menu2")

