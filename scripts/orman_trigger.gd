extends Area2D

@export var orman_scene: PackedScene  # Assign the restaurant scene in the Inspector

func _ready():
	connect("body_entered", _on_body_entered)  # Connect signal for collision detection

func _on_body_entered(body):
	if body.is_in_group("player"):  # Ensure only the player triggers the scene switch
		get_tree().change_scene_to_packed(orman_scene)  # Switch to restaurant scene
