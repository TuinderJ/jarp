extends State

@onready var walking: Node = $"../Walking"

func on_enter():
	playback.travel("Idle")

func state_process(_delta: float) -> void:
	owner.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if owner.direction:
		next_state = walking
	else:
		owner.velocity = owner.velocity.move_toward(owner.direction, owner.friction)
