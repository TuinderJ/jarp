extends Node2D
class_name Level

func _ready() -> void:
	add_player()

func add_player():
	const player_scene = preload("res://entities/player/player.tscn")
	var player = player_scene.instantiate()
	player.global_position = get_node("StartingPosition").global_position
	add_child(player)
