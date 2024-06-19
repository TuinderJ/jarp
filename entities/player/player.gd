extends CharacterBody2D

@onready var animation_tree: = $AnimationTree
@onready var animation_player: = $AnimationPlayer
@onready var state_machine: AnimationNodeStateMachinePlayback = animation_tree["parameters/playback"]

var direction: Vector2

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * Player.SPEED * delta * Player.speed_modifier * Player.temp_speed_modifier

	handle_animations()
	move_and_slide()

func handle_animations():
	if direction:
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
