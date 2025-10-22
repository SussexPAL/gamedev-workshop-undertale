extends RigidBody2D

"""
This script is an example of simulated player movement with a RigidBody2D.

While CharacterBody2D requires in explicit control, RigidBody movement automatically integrates itself with the phsyics simulation if done correctly.
- Instead of directly setting positions or velocity, forces/impulses should be added
- Forces are intended to be applied every frame, like WASD movement or a wind effect
- Impulses are intended to be applied once, like a dash or explosion knockback
- Forces and impluses added here will seamlessly integrate with any external forces in your game (gravity, explosion knockback, etc.)
- What you lose in control you gain in flexibility and automation - everything just works
"""

@export var move_force:float = 5 # How strong the force we apply every physics update should be

# Called every physics update (consistent)
func _physics_process(_delta):
	# Read keyboard input to determine movement direction
	var movement_input = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized() # The movement vector is normalized to prevent diagonal movement from being too fast
	
	# A central force (central meaning it won't affect rotation) is added every physics update
	apply_central_force(movement_input * move_force)
