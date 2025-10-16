extends CharacterBody2D

# Export variables - values that can be easily changed from the inspector window
@export var move_speed:float = 100

# Global variables - accessible by all functions
var input:Vector2 # Defines what WASD keys the player is current pressing. (0,0) is no movement, (1,0) is rightward, and so on.

# Called every frame (framerate varies)
func _process(delta):
	input = Vector2(
		Input.get_axis("move_left", "move_right"),	# Returns 1 to move right, -1 to move left
		Input.get_axis("move_up", "move_down")		# Returns 1 to move up, -1 to move down
		).normalized() 								# Normalize the input vector (diagonal movement should have magnitude of 1)
	
# Called every physics update (consistent rate)
func _physics_process(delta):
	velocity = input * move_speed 	# Set player's velocity (does not move them yet)
	move_and_slide() 				# Tell player to move based on their current velocity
