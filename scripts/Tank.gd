
extends CharacterBody2D
signal press_shoot(direction, pos)
var SPEED = 350

var can_shoot:bool
var can_rapid:bool
var can_rapid_fire:bool
var count :int
var health_bar

var direction: Vector2 = Vector2.UP
func _ready():
	$score_reducer.start()
	can_shoot=true
	can_rapid=true
	can_rapid_fire=true
	Globals.player_health=40
	count=0

func _physics_process(delta):
	if not Globals.is_game_over:
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
			#print('fire')
			can_shoot=false
			$ShootTimer.start()
			if Globals.score>0:
				Globals.score-=2
			var pos=$Marker2D.global_position
			press_shoot.emit(direction,pos)
		
		'''if Input.is_action_pressed("right_shoot") and can_rapid:
			if count>2:
				can_rapid=false
			$RapidTimer.start()
			if count<3 and can_rapid_fire:
				can_rapid_fire=false
				count+=1
				$RapidFireTimer.start()
				print('rapid fire')
				var pos=$Marker2D.global_position
				press_shoot.emit(direction, pos)'''
		
func _on_rapid_timer_timeout():
	count=0
	can_rapid=true
	#print('outer timer ran out')
func _on_shoot_timer_timeout():
	can_shoot=true

func hit():
	if Globals.player_health>0:
		Globals.player_health-=10
		#$on_screen_stuff.player_health.value-=10
		Globals.blink_tween($TankSprite)
	if Globals.player_health<=0:
		Globals.player_lives-=1
		if Globals.player_lives>0:
			Globals.respawn()
			get_tree().paused=true
		else:
			while Globals.score>0:
				Globals.score-=1
			Globals.game_over.emit()
		
	#print(Globals.player_health)
	
func _on_rapid_fire_timer_timeout():
	can_rapid_fire=true


func _on_score_reducer_timeout():
	if Globals.score>0:
		Globals.score-=1
	$score_reducer.start()
