extends Node
"""
This class is responsible for emitting global signals for nodes to listen to.
It should be added as an autoload - it will be present in every single scene.

Should be accessed via $SignalManager, and used to decouple any signals that
are generally/globally useful.

$SignalManager.SIGNAL_NAME.emit()
"""
signal PLAYER_INTERACT_REQUEST # Emits when player presses the interact key
signal DAMAGE_PLAYER(amount:float) # Emits when an entity wants to damage the player
signal PLAYER_HEALTH_CHANGED(old_health, new_health) # Emits when player's health is altered
signal PLAYER_DIED # Emits when player dies
