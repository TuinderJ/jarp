extends Control

@onready var fps: Label = %FPS
@onready var x_position: Label = %XPosition
@onready var y_position: Label = %YPosition
@onready var state: Label = %State
@onready var speed: Label = %Speed
@onready var acceleration: Label = %Acceleration
@onready var friction: Label = %Friction
@onready var currency: Label = %Currency

var player: CharacterBody2D
var state_machine: StateMachine

func find_player() -> void:
	player = Game.player as Player
	state_machine = player.get_node("StateMachine")

func _process(_delta: float) -> void:
	if !Game.player:
		return
	if !player:
		find_player()
	
	fps.text = "FPS: " + str(snapped(Engine.get_frames_per_second(), .1))
	x_position.text = "X: " + str(snapped(player.position.x, 1))
	y_position.text = "Y: " + str(snapped(player.position.y, 1))
	state.text = "State: " + state_machine.current_state.name
	acceleration.text = "Acceleration: " + str(player.acceleration)
	speed.text = "Speed: " + str(snapped(abs(player.velocity.x) + abs(player.velocity.y), 1))
	friction.text = "Friction: " + str(player.friction)
	currency.text = "Currency: " + str(player.inventory.currency)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_debug"):
		visible = !visible
