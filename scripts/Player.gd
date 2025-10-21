extends CharacterBody2D

# Export variables - can be easily changed from the inspector window
@export var move_speed:float = 300
@export var rotate_speed:float = .15
@onready var anim_tree:AnimationTree = $AnimationTree

# Global variables - accessible by all functions in this script
var movement_input:Vector2 = Vector2(0, 0) # Defines what direction the player is trying to move
var last_facing_direction:Vector2 = Vector2(0,0) # Describes the player's last pressed input - does not reset to (0,0)

var rotate_input:float # Defines what direction the player is trying to rotate
var busy:bool = false # Player cannot interact when busy

# Called every frame (framerate varies)
func _process(_delta):
	manage_input()
	update_animation()
	
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
	if movement_input.length() != 0:
		last_facing_direction = movement_input		# Update the last-pressed input vector, for animation
	
	# QE Rotation
	rotate_input = Input.get_axis("rotate_left", "rotate_right")
	# Interact
	if Input.is_action_just_pressed("interact") && not busy:
		SignalManager.PLAYER_INTERACT_REQUEST.emit()

# Animates the player based on current input
func update_animation():
	var idle = !movement_input # returns true if no current movement input (0,0)
	
	# Update the player's animation state
	anim_tree.set("parameters/conditions/idle", idle)
	anim_tree.set("parameters/conditions/run", !idle)
	
	# Update the player's direction to face
	anim_tree.set("parameters/idle/blend_position", last_facing_direction)
	anim_tree.set("parameters/run/blend_position", last_facing_direction)
