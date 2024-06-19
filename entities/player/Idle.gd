extends State

@onready var walking: Node = $"../Walking"

func on_enter():
	playback.travel("Idle")

func state_process(_delta: float) -> void:
	if owner.direction:
		next_state = walking
