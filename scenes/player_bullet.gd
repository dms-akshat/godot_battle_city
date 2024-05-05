extends Area2D

const velocity = 700
var aim: Vector2

func _process(delta):
	if not Globals.is_game_over:
		global_position += aim * velocity * delta
	


func _on_body_entered(body):
	if "break_tile" in body:
		body.break_tile()
	if "enemy_hit" in body:
		body.enemy_hit()
	queue_free()
	
