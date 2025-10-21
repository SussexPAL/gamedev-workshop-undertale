extends Node
"""
This class is responsible for emitting global signals for nodes to listen to.
It should be added as an autoload - it will be present in every single scene.

Should be accessed via $SignalManager
"""
signal PLAYER_INTERACT_REQUEST # Emits when player presses the interact key
