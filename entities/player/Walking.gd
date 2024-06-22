extends State

@onready var idle: Node = $"../Idle"
@onready var dashing: Node = $"../Dashing"

func on_enter():
	playback.travel("Walk")

func state_input(event: InputEvent) -> void:
	if next_state:
		return
	
	if Player.can_move and event.is_action_pressed("dash"):
		next_state = dashing

func state_process(_delta: float) -> void:
	if !owner.direction:
		next_state = idle
	
	owner.top_speed = owner.direction * owner.SPEED * Player.speed_modifier * Player.temp_speed_modifier
	owner.velocity = owner.velocity.move_toward(owner.top_speed, Player.acceleration)
