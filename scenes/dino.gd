extends CharacterBody2D

const GRAVITY = 4200 #ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -1800.0

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_runing:
			$AnimatedSprite2D.play("idle")
		else:
			$RunCol.disabled = false
			if Input.is_action_pressed("ui_accept") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				$JumpSound.play()
			elif Input.is_action_pressed("ui_down"):
				$AnimatedSprite2D.play("duck")
				$RunCol.disabled = true
			else:
				$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")


	move_and_slide()
