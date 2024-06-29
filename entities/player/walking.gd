extends State

@onready var idle: Node = $"../Idle"
@onready var dashing: Node = $"../Dashing"
@onready var attack: Node = $"../Attack"

func on_enter():
	playback.travel("Walk")

func state_input(event: InputEvent) -> void:
	if next_state:
		return
	
	if event.is_action_pressed("attack"):
		next_state = attack
	
	if owner.can_move and event.is_action_pressed("dash") and owner.dash_time and owner.current_stamina >= owner.dash_stamina_drain:
		next_state = dashing

func state_process(_delta: float) -> void:
	owner.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	if !owner.direction:
		next_state = idle
		return
	
	owner.animation_tree.set("parameters/Idle/blend_position", owner.direction)
	owner.animation_tree.set("parameters/Walk/blend_position", owner.direction)
	owner.animation_tree.set("parameters/Attack/blend_position", owner.direction)

	owner.top_speed = owner.direction * owner.speed * owner.speed_modifier * owner.temp_speed_modifier
	owner.velocity = owner.velocity.move_toward(owner.top_speed, owner.acceleration)
