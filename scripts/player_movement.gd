extends CharacterBody2D

@export var move_speed:float = 10 			# How far the player should move every physics update
var movement_input:Vector2 = Vector2(0,0) 	# What direction the player is currently trying to move
@onready var animated_sprite = $AnimatedSprite2D

signal PLAYER_INTERACT_REQUEST # emits when player attempts to interact

func _ready():
	animated_sprite.play("run_right")

# Called every frame (inconsistent, but responsive)
func _process(_delta):
	var horizontal_input:float = Input.get_axis("move_left", "move_right") 		# -1 for left, 1 for right
	var vertical_input:float = Input.get_axis("move_up", "move_down") 			# -1 for up, 1 for down
	
	movement_input = Vector2(horizontal_input, vertical_input).normalized() 	# Normalize the input vector to fix diagonal movement being too fast
	
	if Input.is_action_just_pressed("player_interact"):
		PLAYER_INTERACT_REQUEST.emit()
		print("pressed F")
	
	
# Called every physics update (consistent, but less frequent)
func _physics_process(_delta):
	velocity = movement_input * move_speed 		# Set velocity to the move_speed in the direction of the movement_input
	move_and_slide() 							# Move the player based on their velocity (and collide with things)
