extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed: int = 200
var direction: Vector2
var is_turning:bool=false
var enemyval
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 200
	position.y = 120
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
	%DirectionTimer.start()


func _on_bullet_timer_timeout():
	#if not is_turning:
		var bullet= bullet_scene.instantiate() as RigidBody2D
		var posx=$Bullet_Marker.position.x
		#print(direction)
		var pos=(global_position+direction*posx)
		bullet.global_position=pos
		bullet.linear_velocity=direction*500
		var bullet_sprite= bullet.get_node("Sprite2D")
		bullet.look_at(bullet.linear_velocity + bullet_sprite.global_position)
		bullet.global_rotation_degrees+=90
		#bullet.look_at(bullet.linear_velocity*100)
		
		$Bullets_Fired.add_child(bullet)
		$"../Bullet_Timer".start()
		
		
	
