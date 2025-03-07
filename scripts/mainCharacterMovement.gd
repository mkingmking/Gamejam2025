extends CharacterBody2D


@onready var anim = $mainChar # Reference to the AnimatedSprite2D

@export var speed: float = 200  # Movement speed

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Detect movement input
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
		anim.play("idleMainChar")  # Make sure you have an "idle" animation
