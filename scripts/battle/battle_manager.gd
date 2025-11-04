extends Node

enum BATTLE_STATE {
	ENEMY_CONTROL,		# Used for dialogue, animations, and any state where the player cannot use the UI
	PLAYER_CONTROL,		# Used when player is navigating the UI
	BATTLE				# Used for when the player is playing the bullet hell
}
