extends Node2D

@export var rotate_speed:float = 5

func _physics_process(delta: float) -> void:
	rotate(rotate_speed * delta)
