extends CharacterBody2D

@export var anim:AnimationPlayer # Grab the animation player to reference later
@export var battle_scene:PackedScene # A reference to the generic battle scene

func _ready() -> void:
	$InteractableArea.SUCCESSFUL_INTERACT.connect(_on_successful_interact) # "Call _on_successful_interact when SUCCESSFUL_INTERACT signal is received"

# Is called when the player interacts with this NPC
func _on_successful_interact():
	print("The player is interacting with me!")
	anim.play("pulse") # Makes the NPC bounce
	get_tree().change_scene_to_packed(battle_scene)
 
