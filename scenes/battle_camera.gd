extends Camera2D


var trauma:float = 0 # How much the camera should currently be shaking/reacting, should reduce to 0 over time
@export var trauma_minimum:float = .1
@export var trauma_maximum:float = 10
@export var trauma_decay_rate:float = 12 # How quickly the camera should recover from trauma

@export var shake_rotation_weight:float = .04
@export var shake_position_weight:float = 1.0
@export var shake_zoom_weight:float = .04

@onready var random = RandomNumberGenerator.new()
@onready var target_zoom:float = zoom.x
@onready var target_offset:Vector2 = offset

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
	print(rotation)
	
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
	
