extends State

@onready var idle: Node = $"../Idle"
@onready var dash: Node = $"../Dash"

func on_enter():
	playback.travel("Walk")

func state_input(event: InputEvent) -> void:
	if next_state:
		return
	if Player.can_move and event.is_action_pressed("dash"):
		next_state = dash

func state_process(_delta: float) -> void:
	if !owner.direction:
		next_state = idle
