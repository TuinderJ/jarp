extends Panel

func _ready():
	hide()
	
func _on_resume_button_pressed():
	Game.toggle_pause()

func _on_save_button_pressed() -> void:
	pass # Replace with function body.

func _on_load_button_pressed() -> void:
	pass # Replace with function body.

func _on_exit_button_pressed() -> void:
	get_tree().quit()
