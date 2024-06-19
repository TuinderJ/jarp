extends Node

class_name StateMachine

@onready var animation_tree: AnimationTree = $"../AnimationTree"

@export var current_state: State

var states: Array[State]

func _ready() -> void:
	for child in get_children():
		if child is State:
			states.push_back(child)
			child.playback = animation_tree["parameters/playback"]
		else:
			push_warning("Child" + child.name + " is not a State.")

func _physics_process(delta: float) -> void:
	if current_state.next_state != null:
		change_state(current_state.next_state)
	
	current_state.state_process(delta)

func change_state(new_state: State):
	if current_state != null:
		current_state.on_exit()
		current_state.next_state = null
	
	current_state = new_state
	current_state.on_enter()

func _input(event: InputEvent) -> void:
	current_state.state_input(event)
