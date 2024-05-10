extends PowerUp

func _on_body_entered(body):
	if "health_power_up" in body:
		body.health_power_up()
		queue_free()
