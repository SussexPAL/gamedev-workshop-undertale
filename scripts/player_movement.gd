extends CharacterBody2D

"""
TODO: 
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
