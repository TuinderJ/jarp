extends Node2D
class_name Level

func _ready() -> void:
	add_player()

func add_player():
	var player: Player = Game.player
	if !player:
		const player_scene = preload("res://entities/player/player.tscn")
		player = player_scene.instantiate()
	add_child(player)
	player.position = get_node("StartingPosition").position
