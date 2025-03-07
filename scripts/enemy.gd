extends CharacterBody2D

@export var speed: float = 100  # Enemy movement speed
@export var detection_radius: float = 30000  # How close the player must be for enemy to follow

@onready var anim = $AnimatedSprite2D  # Reference to enemy animation
var player = null  # Reference to the player

func _ready():
	# Find the player in the scene
 
	
	# Find the player dynamically instead of hardcoding the path
	player = get_tree().get_first_node_in_group("player")
	
	if player == null:
		await get_tree().process_frame
		player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if player and is_instance_valid(player):
		var distance = global_position.distance_to(player.global_position)
		
		if distance < detection_radius :  # Don't stop too far away
			# Move towards player
			var direction = (player.global_position - global_position)
			velocity = direction * speed
			move_and_slide()
			
			if get_last_slide_collision():
				velocity = Vector2.ZERO
			
			# Play correct animation based on movement direction
			if direction.x > 0:
				anim.play("enemyWalkEast")
			elif direction.x < 0:
				anim.play("enemyWalkWest")
			elif direction.y > 0:
				anim.play("enemyWalkSouth")
			elif direction.y < 0:
				anim.play("enemyWalkNorth")
		else:
			anim.play("enemyIdle")  # Idle animation when not chasing
