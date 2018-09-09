extends AnimatedSprite

func update(motion):
	if motion.y < 0:
		play("jump")
	flip_h = false
	if motion.x > 0:
		play("run")
	elif motion.x < 0:
		flip_h = true
		play("run")
	else:
		play("idle")
