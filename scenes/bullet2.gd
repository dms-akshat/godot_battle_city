extends Area2D

const velocity = 500
var aim: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	$Laser_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += aim * velocity * delta
	


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	
	queue_free()


func _on_laser_timer_timeout():
	queue_free()
