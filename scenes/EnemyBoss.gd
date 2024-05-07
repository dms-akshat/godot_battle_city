extends Enemy

func _ready():
	speed=120
	bullet_scene=preload("res://scenes/enemy_boss_bullet.tscn")
	position.x = 500
	position.y = 240
	direction = get_random_direction()
	var health:int=Globals.tank_destroyed/10
	enemy_health=maxi(50,50+(health)*10)
	print("Boss")
	print(enemy_health)
	$EnemySprite/ProgressBar.max_value=enemy_health
	$EnemySprite/ProgressBar.value=enemy_health



func enemy_hit():
	if enemy_health>0:
		enemy_health-=10
		Globals.blink_tween(%EnemySprite)
	if enemy_health<=0:
		Globals.score+=(50+(50*(Globals.boss_tank_destroyed+1)))
		#Globals.tank_destroyed+=1
		Globals.boss_tank_destroyed+=1
		$"..".queue_free()
	$EnemySprite/ProgressBar.value=enemy_health

func _on_bullet_timer_timeout():
	if not Globals.is_game_over:
		var bullet= bullet_scene.instantiate() as Area2D
		var posx=$Bullet_Marker.position.x
		#print(direction)
		var pos=(global_position+direction*posx)
		bullet.global_position=pos
		bullet.aim=direction
		var bullet_sprite= bullet.get_node("Sprite2D")
		bullet.look_at(bullet.aim + bullet_sprite.global_position)
		#bullet.global_rotation_degrees+=90
		
		$Bullets_Fired.add_child(bullet)
		$"../Bullet_Timer".start()
