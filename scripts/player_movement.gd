extends CharacterBody2D

"""
TODO: 
	- Recolor placeholder ground texture using GradientTexture2D
	- Refactor scene tree (set rigidbody/statidbody as parent node. Already done on github repo.)
	- Convert positional movement to rigidbody movement (move_and_slide())
	- Add @export variable for movement speed
	- Vectorize the movement input (and normalize it)
"""

# Called every frame (framerate varies)
func _process(_delta):
	if Input.is_action_pressed("move_right"):
		position.x += 5
	if Input.is_action_pressed("move_left"):
		position.x += -5
	if Input.is_action_pressed("move_up"):
		position.y += -5
	if Input.is_action_pressed("move_down"):
		position.y += 5
