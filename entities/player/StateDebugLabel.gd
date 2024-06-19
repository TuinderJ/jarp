extends Label

@onready var state_machine: StateMachine = $"../StateMachine"

func _process(_delta: float) -> void:
	text = state_machine.current_state.name
