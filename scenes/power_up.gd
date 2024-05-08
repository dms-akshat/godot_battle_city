extends Area2D


func _on_body_entered(body):
	if "power_up" in body:
		body.power_up()
		queue_free()


func _on_timer_timeout():
	queue_free()
