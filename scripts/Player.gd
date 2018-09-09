extends KinematicBody2D

var motion = Vector2()
const SPEED = 750
const GRAVITY = 1000
const UP = Vector2(0, -1)
const JUMP_SPEED = -520
var DOUBLE_JUMP_COUNTER

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)
	
func _ready():
	DOUBLE_JUMP_COUNTER = 0
	
func run():
	$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")

func fall(delta):
	if is_on_floor():
		DOUBLE_JUMP_COUNTER = 0
		motion.y = 0
	else:
		motion.y += GRAVITY * delta

func jump():
	if Input.is_action_just_pressed("ui_up"):
		if DOUBLE_JUMP_COUNTER == 0:
			motion.y = JUMP_SPEED
			DOUBLE_JUMP_COUNTER = 1
		elif DOUBLE_JUMP_COUNTER == 1:
			motion.y = JUMP_SPEED
			DOUBLE_JUMP_COUNTER = 2