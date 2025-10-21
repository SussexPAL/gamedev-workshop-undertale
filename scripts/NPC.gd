extends CharacterBody2D

@export var anim:AnimationPlayer

func _ready() -> void:
	$InteractableArea.SUCCESSFUL_INTERACT.connect(_on_successful_interact) # "Call _on_successful_interact when SUCCESSFUL_INTERACT signal is received"

func _on_successful_interact():
	print("The player tried to interact with me!")
	anim.play("pulse")
