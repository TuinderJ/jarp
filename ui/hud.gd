extends Control

@onready var health_bar: ProgressBar = %HealthBar
@onready var mana_bar: ProgressBar = %ManaBar
@onready var stamina_bar: ProgressBar = %StaminaBar

func initialize(player: Player):
	player.max_health_updated.connect(update_max_health)
	update_max_health(player.max_health)
	player.health_updated.connect(update_health)
	update_health(player.current_health)
	
	player.max_mana_updated.connect(update_max_mana)
	update_max_mana(player.max_mana)
	player.mana_updated.connect(update_mana)
	update_mana(player.current_mana)
	
	player.max_stamina_updated.connect(update_max_stamina)
	update_max_stamina(player.max_stamina)
	player.stamina_updated.connect(update_stamina)
	update_stamina(player.current_stamina)

func update_max_health(new_value: int):
	health_bar.max_value = new_value

func update_health(new_value: int):
	health_bar.value = new_value

func update_max_mana(new_value: int):
	mana_bar.max_value = new_value

func update_mana(new_value: int):
	mana_bar.value = new_value

func update_max_stamina(new_value: int):
	stamina_bar.max_value = new_value

func update_stamina(new_value: float):
	stamina_bar.value = new_value
