extends CharacterBody2D

@export var move_speed:float = 300
var movement_input = Vector2(0,0)
@export var hp_max: float = 1000
var hp_current:float = hp_max
@export var invincible_duration:float = 2
@export var invincible_opacity:float = .5
var invincible = false
@export var sprite:Sprite2D

func _ready() -> void:
	SignalManager.DAMAGE_PLAYER.connect(take_damage)

func _process(_delta):
	manage_input()

func _physics_process(_delta):
	velocity = movement_input * move_speed 		# Set player velocity based on most recent input
	move_and_slide() 							# Move player based on current velocity

func manage_input():
	# WASD Movement
	movement_input = Vector2(						# Type is Vector2 (x, y)
		Input.get_axis("move_left", "move_right"),	# Returns 1 to move right, -1 to move left
		Input.get_axis("move_up", "move_down")		# Returns 1 to move up, -1 to move down
		).normalized() 								# Normalize the input vector (diagonal movement should have magnitude of 1)

func take_damage(amount:float):
	# Do not do anything if the player is currently invincible
	if invincible:
		return
	
	# Modify HP and start invinciblity timer
	var old_hp:float = hp_current
	hp_current = clamp(hp_current - amount, 0, hp_max) # Make sure hp doesn't go below 0 or above max_hp
	start_invincibility()
	
	# Send out important signals
	SignalManager.PLAYER_HEALTH_CHANGED.emit(old_hp, hp_current) # Tell the world your health has changed! (Used by UI elements and enemies)
	if hp_current == 0:
		SignalManager.PLAYER_DIED.emit()

# Start the player's temporary invincibility frames after taking damage
func start_invincibility():
	# Make player invincible
	invincible = true
	sprite.self_modulate.a = .5 # Set opacity for player feedback
	
	# Create a timer to end invincibility
	var timer:Timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.wait_time = invincible_duration
	timer.timeout.connect(end_invincibility)
	timer.start()

# Start the player's temporary invincibility frames, usually called by a timeout
func end_invincibility():
	invincible = false
	sprite.self_modulate.a = 1
