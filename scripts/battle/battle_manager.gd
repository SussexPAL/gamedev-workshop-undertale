extends Node



enum BATTLE_STATE {
	ENEMY_CONTROL,		# Used for dialogue, animations, and any state where the player cannot use the UI
	PLAYER_CONTROL,		# Used when player is navigating the UI
	BATTLE				# Used for when the player is playing the bullet hell
}

func _ready() -> void:
	SignalManager.connect("PLAYER_DIED", player_died)
	
func player_died():
	print("oh no the player is dead!")
	exit_to_overworld.call_deferred()
	
	
func exit_to_overworld():
	get_tree().change_scene_to_file("res://scenes/overworld_scene.tscn")
