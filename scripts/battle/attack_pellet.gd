extends Area2D

@export var damage_amount:float = 10 # How much this pellet should damage the player on collision


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		SignalManager.DAMAGE_PLAYER.emit(damage_amount)
