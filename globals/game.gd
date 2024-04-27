extends Node

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_game"):
		toggle_pause()

func toggle_pause() -> void:
	get_tree().paused = !get_tree().paused
	Ui.pause_menu.visible = get_tree().paused
	Ui.hud.visible = !get_tree().paused
