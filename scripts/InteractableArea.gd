extends Area2D
class_name InteractableArea

var player_nearby:bool = false
@export var input_prompt:Label # Label object containing the prompt text
@export var prompt_animator:AnimationPlayer # Node responsible for animating the input prompt

signal SUCCESSFUL_INTERACT


# Called once on startup
func _ready() -> void:
	SignalManager.PLAYER_INTERACT_REQUEST.connect(_on_player_interact_request) # Tell the _on_player_interact function to call if PLAYER_INTERACT signal is received
	input_prompt.hide() # Hide input prompt unless player is nearby
	prompt_animator.play("float") # Always play the float animation - doesn't matter if hidden


# Emits a signal on succesful player interact
func _on_player_interact_request():
	if player_nearby:
		SUCCESSFUL_INTERACT.emit()


# Called whenever a body enters this Area2D
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_nearby = true
		input_prompt.show()
		
# Called whenever a body exits this Area2D
func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_nearby = false
		input_prompt.hide()
