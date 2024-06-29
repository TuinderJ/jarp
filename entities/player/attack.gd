extends State

@onready var idle: Node = $"../Idle"

func on_enter() -> void:
	owner.velocity = Vector2.ZERO
	playback.travel("Attack")

func on_attack_animation_finished() -> void:
	next_state = idle
