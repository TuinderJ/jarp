extends CharacterBody2D

@onready var animation_tree: = $AnimationTree
@onready var animation_player: = $AnimationPlayer
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

const TILE_MAP_GROUND_LAYER: = 0
const SPEED: = 200.0
const DASH_TIME: = .2
const BASE_ACCELERATION: = 25.0
const BASE_FRICTION: = 25.0

var direction: Vector2
var tile_map: TileMap
var top_speed: Vector2

func _ready() -> void:
	#Engine.time_scale = 0.05
	Player.camera = $Camera2D
	tile_map = get_parent().get_node("TileMap")

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()

	handle_terrain()

	handle_animations()
	move_and_slide()

func handle_animations() -> void:
	if direction:
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)

func handle_terrain() -> void:
	var tile_data: TileData = tile_map.get_cell_tile_data(TILE_MAP_GROUND_LAYER, tile_map.local_to_map(global_position))
	if tile_data:
		Player.acceleration = tile_data.get_custom_data("acceleration")
		Player.friction = tile_data.get_custom_data("friction")
	else:
		Player.acceleration = BASE_ACCELERATION
		Player.friction = BASE_FRICTION
