extends CharacterBody2D

# Export variables - can be easily changed from the inspector window
@export var move_speed:float = 300
@export var rotate_speed:float = .15

# Global variables - accessible by all functions in this script
var movement_input:Vector2 # Defines what direction the player is trying to move
var rotate_input:float # Defines what direction the player is trying to rotate
var busy:bool = false # Player cannot interact when busy

# Called every frame (framerate varies)
func _process(_delta):
	manage_input()
	
# Called every physics update (consistent rate)
func _physics_process(_delta):
	velocity = movement_input * move_speed 		# Set player velocity based on most recent input
	move_and_slide() 							# Move player based on current velocity
	rotation += rotate_input * rotate_speed 	# Rotate the player, just for fun

# Responsible for reading player input
func manage_input():
	# WASD Movement
	movement_input = Vector2(						# Type is Vector2 (x, y)
		Input.get_axis("move_left", "move_right"),	# Returns 1 to move right, -1 to move left
		Input.get_axis("move_up", "move_down")		# Returns 1 to move up, -1 to move down
		).normalized() 								# Normalize the input vector (diagonal movement should have magnitude of 1)
	# QE Rotation
	rotate_input = Input.get_axis("rotate_left", "rotate_right")
	# Interact
	if Input.is_action_just_pressed("interact") && not busy:
		SignalManager.PLAYER_INTERACT_REQUEST.emit()
