extends State

@onready var walking: Node = $"../Walking"

func on_enter():
	playback.travel("Idle")

func state_process(_delta: float) -> void:
	if owner.direction:
		next_state = walking
	else:
		owner.velocity = owner.velocity.move_toward(owner.direction, Player.friction)
