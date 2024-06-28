extends Node

class_name State

var next_state: State
var playback: AnimationNodeStateMachinePlayback

func on_enter():
	pass

func on_exit():
	pass

func state_input(_event: InputEvent) -> void:
	pass

func state_process(_delta: float) -> void:
	pass
