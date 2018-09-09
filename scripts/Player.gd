extends KinematicBody2D

var motion = Vector2()
const SPEED = 750

func _physics_process(delta):
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
	move_and_slide(motion)
		
		

#func _ready():
#	pass
