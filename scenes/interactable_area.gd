extends Area2D

var player_nearby:bool = false # true if player is within interaction range

func _on_body_entered(body):
	if body.is_in_group("player"):	# a;sdlkfja;sldkfj;asldkj
		player_nearby = true
		print("someone entered!")

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_nearby = false

func _on_player_player_interact_request():
	if player_nearby:
		print("Successful interact!")
