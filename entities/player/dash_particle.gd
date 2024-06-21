extends GPUParticles2D

func _ready() -> void:
	finished.connect(on_finish)
	emitting = true

func on_finish() -> void:
	queue_free()
