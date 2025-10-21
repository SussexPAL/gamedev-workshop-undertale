extends Camera2D

@export var follow_target:Node2D	# what node the camera should try to follow (change through script for dynamic camera movement)
@export var follow_speed:float = 5 # How fast the camera should lerp to the target
@export var lead_ahead:bool = false # If true, will attempt to stay ahead of target instead of chasing
@export var zoom_multiplier:float = .1 # What percentage the zoom should change per scroll event

@onready var target_pos:Vector2 = follow_target.position # The position the camera will try to lerp toward

func _process(_delta: float) -> void:
	handle_zoom()
	handle_movement(_delta)
	
func handle_movement(_delta:float):
	target_pos = follow_target.position
	position = lerp(position, target_pos, follow_speed * _delta)
	
func handle_zoom():
	if Input.is_action_just_pressed("zoom_in"):
		zoom *= 1 + zoom_multiplier
	elif Input.is_action_just_pressed("zoom_out"):
		zoom /= 1 + zoom_multiplier
