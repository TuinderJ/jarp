extends CharacterBody2D
class_name Player

signal max_health_updated(max_health: int)
signal health_updated(current_health: int)
signal max_mana_updated(max_mana: int)
signal mana_updated(current_mana: int)
signal max_stamina_updated(max_stamina: int)
signal stamina_updated(current_stamina: float)

@export var inventory: PlayerInventory
@export_group("Movement")
@export var speed: = 200.0 ## Player movement speed.
@export var base_acceleration: = 25.0 ## Acceleration if the tile the player is currently standing on does not have the acceleration set.
@export var base_friction: = 25.0 ## Friction if the tile the player is currently standing on does not have the friction set.
@export var dash_time: = .2 ## Amount of time spent dashing. Increase for a longer dash.
@export var max_stamina: int: ## Amount of stamina the player has.
	set(new_value):
		max_stamina = new_value
		max_stamina_updated.emit(max_stamina)
@export var stamina_recharge_rate: float ## The amount of stamina that will recharge over 1 second.
@export var dash_stamina_drain: = 5 ## How much stamina a dash will take.
@export_group("Combat")
@export var max_health: int:
	set(new_value):
		max_health = new_value
		max_mana_updated.emit(max_health)
@export var max_mana: int:
	set(new_value):
		max_mana = new_value
		max_mana_updated.emit(max_mana)
@export var damage: int ## Base player damage with no weapon equiped.
@export var armor: int ## Base armor value with no armor equiped.

@onready var animation_tree: = $AnimationTree
@onready var animation_player: = $AnimationPlayer
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]
@onready var camera: Camera2D = $Camera

const TILE_MAP_GROUND_LAYER: = 0

var can_move: = true
var has_control_of_camera: = true

var direction: Vector2
var acceleration: float
var tile_map: TileMap
var friction: float
var top_speed: Vector2
var speed_modifier: = 1.0
var temp_speed_modifier: = 1.0
var stamina_recharge_tween: Tween

var current_health: int:
	set(new_value):
		current_health = new_value
		health_updated.emit(current_health)
var current_mana: int:
	set(new_value):
		current_mana = new_value
		mana_updated.emit(current_mana)
var current_stamina: float:
	set(new_value):
		current_stamina = new_value
		stamina_updated.emit(current_stamina)

func _ready() -> void:
	#Engine.time_scale = 0.05
	
	if !current_health:
		current_health = max_health
	if !current_mana:
		current_mana = max_mana
	if !current_stamina:
		current_stamina = float(max_stamina)
	
	Ui.hud.initialize(self)
	Game.player = self
	tile_map = get_parent().get_node("TileMap")
	animation_tree.set("parameters/Idle/blend_position", Vector2(0, 1))

func _physics_process(_delta: float) -> void:
	handle_terrain()
	move_and_slide()

func handle_terrain() -> void:
	var tile_data: TileData = tile_map.get_cell_tile_data(TILE_MAP_GROUND_LAYER, tile_map.local_to_map(global_position))
	if tile_data:
		acceleration = tile_data.get_custom_data("acceleration")
		friction = tile_data.get_custom_data("friction")
	else:
		acceleration = base_acceleration
		friction = base_friction

func save() -> Dictionary:
	var save_data = {
		"file_name": get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"position_x": position.x,
		"position_y": position.y,
	}
	
	ResourceSaver.save(inventory, "user://player_inventory.tres")
	return save_data

func _load() -> void:
	inventory = load("user://player_inventory.tres").duplicate()

func _input(event: InputEvent) -> void:
	#TODO Remove this. It's only for testing.
	if event is InputEventMouseButton:
		if event.pressed:
			take_damage()

func take_damage():
	if current_health == 0:
		current_health = max_health + 1
	current_health -= 1
	inventory.consumables_inventory[0].quantity -= 1
	inventory.currency -= 1
