extends EnemyBullet

func _on_body_entered(body):
	if "break_tile" in body:
		body.break_tile()
	if "hit" in body:
		Globals.is_enemy_boss_bullet=true
		body.hit()
	queue_free()
