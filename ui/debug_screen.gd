extends Control

@onready var state: Label = $MarginContainer/VBoxContainer/State
@onready var speed: Label = $MarginContainer/VBoxContainer/Speed
@onready var acceleration: Label = $MarginContainer/VBoxContainer/Acceleration
@onready var friction: Label = $MarginContainer/VBoxContainer/Friction
@onready var state_machine: StateMachine = $"../../StateMachine"

var player: CharacterBody2D

func _ready() -> void:
	player = owner

func _process(_delta: float) -> void:
	state.text = "State: " + state_machine.current_state.name
	acceleration.text = "Acceleration: " + str(Player.acceleration)
	speed.text = "Speed: " + str(snapped(abs(player.velocity.x) + abs(player.velocity.y), 1))
	friction.text = "Friction: " + str(Player.friction)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_debug"):
		visible = !visible
