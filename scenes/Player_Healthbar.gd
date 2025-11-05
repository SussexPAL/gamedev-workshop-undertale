extends ProgressBar

func _ready() -> void:
	SignalManager.PLAYER_HEALTH_CHANGED.connect(update_value)
	
func update_value(old_value, new_value):
	value = new_value
