extends Area2D

const velocity = 500
var aim: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += aim * velocity * delta
	


func _on_body_entered(body):
	if "break_tile" in body:
		body.break_tile()
	queue_free()
