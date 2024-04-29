extends Area2D

const velocity = 500
var aim: Vector2

func _process(delta):
	if not Globals.is_game_over:
		global_position += aim * velocity * delta
	


func _on_body_entered(body):
	if "break_tile" in body:
		body.break_tile()
	if "hit" in body:
		body.hit()
	queue_free()
