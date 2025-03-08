extends Node2D

@export var enemy_scene: PackedScene  # Drag Enemy.tscn here in Inspector
@export var spawn_positions: Array[Vector2] = [Vector2(300, 300), Vector2(600, 400), Vector2(800, 200)]

#func _ready():
	#for pos in spawn_positions:
		#var enemy = enemy_scene.instantiate()  # Create enemy instance
		#enemy.global_position = pos  # Set position
		#add_child(enemy)  # Add to scene
