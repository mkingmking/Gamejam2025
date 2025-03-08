extends CharacterBody2D

@onready var anim = $mainChar  # Reference to the AnimatedSprite2D

@export var speed: float =200  # Movement speed

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Detect movement input
	if Input.is_action_pressed("ui_right") and position.x < 1000 :
		direction.x += 1
	if Input.is_action_pressed("ui_left") and position.x > 0:
		direction.x -= 1
	if Input.is_action_pressed("ui_down") and position.y < 950:
		direction.y += 1
	if Input.is_action_pressed("ui_up") and position.y > 750 :
		direction.y -= 1

	# Apply movement
	velocity = direction.normalized() * speed
	move_and_slide()
	
	position.x = clamp(position.x, 0, 1000)
	position.y = clamp(position.y, 700, 1050)
	

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
		anim.play("idleMainChar")  # Make sure you have an "idle" animation
