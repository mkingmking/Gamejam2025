extends CharacterBody2D

@onready var anim = $mainCharOrman  # Reference to the AnimatedSprite2D

@export var speed: float = 200  # Movement speed
var is_hitting = false  # Flag to track hitting state

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Detect movement input (only allow movement if not hitting)
	if not is_hitting:
		if Input.is_action_pressed("ui_right"):
			direction.x += 1
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
		if Input.is_action_pressed("ui_down"):
			direction.y += 1
		if Input.is_action_pressed("ui_up"):
			direction.y -= 1

		# Apply movement
		velocity = direction.normalized() * speed
		move_and_slide()

		# Play correct animation based on movement direction
		if direction.x > 0:
			anim.play("walkRightMainChar")
		elif direction.x < 0:
			anim.play("walkLeftMainChar")
		elif direction.y > 0:
			anim.play("walkSouthMainChar")
		elif direction.y < 0:
			anim.play("walkNorthMainChar")
		else:
			anim.play("idleMainChar")

	# Detect attack input (press "X")
	if Input.is_action_just_pressed("attack"):
		play_hit_animation()

func play_hit_animation():
	is_hitting = true  # Prevent movement while hitting
	
	# Play attack animation based on last movement direction
	if anim.animation == "walkRightMainChar":
		anim.play("hitRightMainChar")
	elif anim.animation == "walkLeftMainChar":
		anim.play("hitLeftMainChar")
	elif anim.animation == "walkSouthMainChar":
		anim.play("hitSouthMainChar")
	elif anim.animation == "walkNorthMainChar":
		anim.play("hitNorthMainChar")
	else:
		anim.play("hitSouthMainChar")  # Default attack direction if standing still

	# Wait for animation to finish before allowing movement again
	await anim.animation_finished
	is_hitting = false
