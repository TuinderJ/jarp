extends CharacterBody2D

const SPEED := 15000.0

@onready var animation_tree = $AnimationTree
@onready var animation_player = $AnimationPlayer
var state_machine: AnimationNodeStateMachinePlayback

func _ready() -> void:
	state_machine = animation_tree["parameters/playback"]

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED * delta

	handle_animations(direction)
	move_and_slide()

func handle_animations(direction: Vector2):
	if direction:
		animation_tree.set("parameters/Idle/blend_position", direction)
		animation_tree.set("parameters/Walk/blend_position", direction)
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
