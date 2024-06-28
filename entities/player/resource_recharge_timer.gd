extends Timer

func _on_timeout() -> void:
	owner.current_stamina += owner.stamina_recharge_rate * wait_time
	owner.current_stamina = clamp(owner.current_stamina, 0, owner.max_stamina)
