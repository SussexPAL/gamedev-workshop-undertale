extends Camera2D

# Trauma - How much shake-worthy-stuff the camera is experiencing
var trauma:float = 0 						# Current trauma value. Should reduce to 0 over time
@export var trauma_minimum:float = .1		# Trauma will reset to 0 if it falls below this value. Ensures trauma fully reduces to 0.
@export var trauma_maximum:float = 10		# Trauma cannot exceed this value. Prevents excessive camera shake and motion sickness.
@export var trauma_decay_rate:float = 12 	# How quickly the camera should recover from trauma

# Weights - how much the camera should shake, rotate, and zoom in response to trauma
@export var shake_rotation_weight:float = .04
@export var shake_position_weight:float = 1.0
@export var shake_zoom_weight:float = .04

@onready var random = RandomNumberGenerator.new()		# Object used to generate random values
@onready var target_zoom:float = zoom.x					# The zoom the camera should have at trauma 0
@onready var target_offset:Vector2 = offset				# The offset the camera should have at trauma 0
# There could be a target_rotation here, but I can't think of many cases where you would want a default rotation other than 0
# Target_position would be appropriate if you want the camera to follow the player. Our camera position is static.

func _ready() -> void:
	SignalManager.PLAYER_HEALTH_CHANGED.connect(_on_player_damaged)
	
func _process(delta: float) -> void:
	shake_camera(delta)

func shake_camera(delta:float):
	trauma = lerp(trauma, 0.0, trauma_decay_rate * delta)
	if trauma < .1:
		trauma = 0
	var pos_shake = shake_position_weight * trauma
	offset.x = target_offset.x + random.randf_range(-pos_shake, pos_shake)
	offset.y = target_offset.y + random.randf_range(-pos_shake, pos_shake)
	
	var rot_shake = shake_rotation_weight * trauma
	rotation = random.randf_range(-rot_shake, rot_shake)
	
	var zoom_shake = shake_zoom_weight * trauma
	zoom.x = target_zoom + random.randf_range(-zoom_shake, zoom_shake)
	zoom.y = target_zoom + random.randf_range(-zoom_shake, zoom_shake)


func add_trauma(amount:float):
	var new_trauma = trauma + amount
	trauma = clamp(new_trauma, trauma_minimum, trauma_maximum)
	

func _on_player_damaged(old_hp:float, new_hp:float):
	var damage_taken:float = old_hp - new_hp
	if damage_taken > 0:
		add_trauma(damage_taken)
	
