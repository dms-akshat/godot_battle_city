
extends CharacterBody2D
signal press_shoot(direction, pos)
var SPEED = 200
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")
var can_shoot:bool=true
var can_rapid:bool=true
var can_rapid_fire: bool=true
var count:int =0

var direction: Vector2
func _ready():
	pass # Replace with function body.
	#can_shoot=true

func _physics_process(delta):
	
	move_and_slide()
	if(Input.is_action_pressed("ui_left")):
		velocity = Vector2(-SPEED, 0)
		rotation_degrees = -90
		direction=Vector2.LEFT
	if(Input.is_action_pressed("ui_right")):
		velocity = Vector2(SPEED, 0)
		rotation_degrees = 90
		direction=Vector2.RIGHT
	if(Input.is_action_pressed("ui_up")):
		velocity = Vector2(0, -SPEED) 
		rotation_degrees = 0
		direction=Vector2.UP
		
	if(Input.is_action_pressed("ui_down")):
		velocity = Vector2(0, SPEED)
		rotation_degrees = 180
		direction=Vector2.DOWN

	if(Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		velocity = Vector2(0,0)
	if(Input.is_action_pressed("shoot") and can_shoot):
		print('fire')
		can_shoot=false
		$ShootTimer.start()
		var pos=$Marker2D.position
		press_shoot.emit(direction, pos)
	if Input.is_action_pressed("right_shoot") and can_rapid:
		#print('rapid fire')
		if count>=3:
			print('all 3 done firing')
		can_rapid=false
		$RapidTimer.start()
		if count<3 and can_rapid_fire:
			can_rapid_fire=false
			print('can_fire_rapid is false')
			print('rapid firing')	
			print('count=')
			print(count)
			count=count+1
			print('count increased')
			$RapidTimer/RapidFireTimer.start()
		
		


func _on_press_shoot(direction, pos):
	print('fire recieve')
	var bullet= bullet_scene.instantiate() as RigidBody2D
	bullet.position=pos
	bullet.linear_velocity= direction*500
	$Bullets.add_child(bullet)
	



func _on_rapid_timer_timeout():
	count=0
	can_rapid=true
func _on_shoot_timer_timeout():
	can_shoot=true


func _on_rapid_fire_timer_timeout():
	can_rapid_fire=true
	print('can_rapid_fire is true \ntimer out')
