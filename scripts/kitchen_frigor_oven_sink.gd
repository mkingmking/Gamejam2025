extends Area2D

# Reference to the firework Sprite2D node
@export var firework: Sprite2D

# Variable to track if the player is in the area
var player_in_area: bool = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("ui_e"):
		if firework:
			firework.visible = true # Make the firework visible
			firework.get_node("AnimationPlayer").play("firework_animation") # Play the animation

func _on_Area2D_body_entered(body):
	if body.name == "Player": # Replace "Player" with the name of your player node
		player_in_area = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		player_in_area = false


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
