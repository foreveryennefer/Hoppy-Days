extends KinematicBody2D

var motion = Vector2()
const SPEED = 400
const GRAVITY = 1000
const UP = Vector2(0, -1)
const JUMP_SPEED = -520
var DOUBLE_JUMP_COUNTER

export var world_limit = 1760

func _physics_process(delta):
	update_motion(delta)

func _process(delta):
	update_animation(motion)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)
	
	
func update_animation(motion):
	$AnimatedSprite.update(motion)

func _ready():
	DOUBLE_JUMP_COUNTER = 0
	Global.Player = self
	
func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
	else:
		motion.x = 0

func fall(delta):
	if is_on_floor():
		DOUBLE_JUMP_COUNTER = 0
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta
		
	if position.y > world_limit:
		Global.GameState.end_game()

func jump():
	if Input.is_action_just_pressed("ui_up"):
		if DOUBLE_JUMP_COUNTER == 0:
			motion.y = JUMP_SPEED
			DOUBLE_JUMP_COUNTER = 1
			Global.jump_sfx.play()
		elif DOUBLE_JUMP_COUNTER == 1:
			motion.y = JUMP_SPEED
			DOUBLE_JUMP_COUNTER = 2
			Global.jump_sfx.play()

func hurt():
	motion.y = JUMP_SPEED
	Global.pain_sfx.play()
