extends CharacterBody2D
class_name Enemy
var speed: int = 200
var direction: Vector2
var is_turning:bool=false
var enemyval
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")
var enemy_health:int

func _ready():
	position.x = 500
	position.y = 240
	direction = get_random_direction()
	enemy_health=20


func get_random_direction() -> Vector2:
	var directions = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]
	var rand_index = randi() % directions.size()
	return directions[rand_index]

func _process(delta):
	if not Globals.is_game_over:
		velocity = direction*speed
		enemyval=velocity
		%EnemySprite.look_at(velocity + %EnemySprite.global_position)
		move_and_slide()
	
	
func _on_direction_timer_timeout():
	direction = get_random_direction()
	%Bullet_Timer.start()
	%DirectionTimer.start()

func enemy_hit():
	if enemy_health>0:
		enemy_health-=10
		Globals.blink_tween(%EnemySprite)
	if enemy_health<=0:
		Globals.score+=50
		Globals.tank_destroyed+=1
		$"..".queue_free()

func _on_bullet_timer_timeout():
	if not Globals.is_game_over:
		var bullet= bullet_scene.instantiate() as Area2D
		var posx=$Bullet_Marker.position.x
		var pos=(global_position+direction*posx)
		bullet.global_position=pos
		bullet.aim=direction
		var bullet_sprite= bullet.get_node("Sprite2D")
		bullet.look_at(bullet.aim + bullet_sprite.global_position)
		$Bullets_Fired.add_child(bullet)
		$"../Bullet_Timer".start()
		
		
	
