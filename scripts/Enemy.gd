extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed: int = 100
var direction: Vector2
var is_turning:bool=false
var enemyval
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 500
	position.y = 240
	direction = get_random_direction()

func get_random_direction() -> Vector2:
	var directions = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]
	var rand_index = randi() % directions.size()
	return directions[rand_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction*speed
	enemyval=velocity
	%EnemySprite.look_at(velocity + %EnemySprite.global_position)
	move_and_slide()
	
	
func _on_direction_timer_timeout():
	direction = get_random_direction() # Replace with function body.
	#is_turning=true
	%Bullet_Timer.start()
	%DirectionTimer.start()


func _on_bullet_timer_timeout():
	#if not is_turning:
<<<<<<< HEAD
		#var bullet= bullet_scene.instantiate() as RigidBody2D
		var posx=$Bullet_Marker.position.x
		#print(direction)
		var pos:Vector2=(global_position+direction*posx)
		#bullet.global_position=pos
		#bullet.linear_velocity=direction*500
		#var bullet_sprite= bullet.get_node("Sprite2D")
		#bullet.look_at(bullet.linear_velocity + bullet_sprite.global_position)
		#bullet.global_rotation_degrees+=90
=======
		var bullet= bullet_scene.instantiate() as Area2D
		var posx=$Bullet_Marker.position.x
		#print(direction)
		var pos=(global_position+direction*posx)
		bullet.global_position=pos
		bullet.aim=direction
		var bullet_sprite= bullet.get_node("Sprite2D")
		bullet.look_at(bullet.aim + bullet_sprite.global_position)
		bullet.global_rotation_degrees+=90
>>>>>>> dbab5b9275f2dc7c3af9da112f48ba56030ac423
		#bullet.look_at(bullet.linear_velocity*100)
		var bullet= bullet_scene.instantiate() as Area2D
		bullet.global_position=pos
		bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
		bullet.aim = direction
		#$Bullets.add_child(bullet) # Replace with function body.
		$Bullets_Fired.add_child(bullet)
		$"../Bullet_Timer".start()
		
		
	
