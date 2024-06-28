extends Panel
class_name PauseMenu

@onready var inventory_menu: InventoryMenu = %InventoryMenu

func _ready():
	hide()

func _on_resume_button_pressed():
	Game.toggle_pause()

func _on_save_button_pressed() -> void:
	Game.save_game()

func _on_load_button_pressed() -> void:
	Game.load_game()

func _on_exit_button_pressed() -> void:
	get_tree().quit()
