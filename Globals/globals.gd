extends Node

var is_game_over:bool=false
var is_main_menu:bool=true
#var working_scene:PackedScene=preload("res://Level_1.tscn")
var player_health:int=30
signal game_over
signal pause_pressed
signal stat_change
signal boss_destroyed()
var pos
var score:int = 500
var tank_destroyed:int = 0:
	get:
		return tank_destroyed
	set(value):
		tank_destroyed=value
var player_lives:int=1
var en_flags:int=3
var boss_tank_destroyed:int=0:
	get:
		return boss_tank_destroyed
	set(value):
		boss_tank_destroyed=value
var is_enemy_boss_bullet:bool=false
var player_bullet_speed:int=600
var is_mode_2:bool=false


#var current_scene: PackedScene

func _ready():
	process_mode=Node.PROCESS_MODE_ALWAYS



func blink_tween(body):
	var tween=get_tree().create_tween()
	tween.tween_property(body, "modulate", Color(1,1,1,0), 0.1 ).from(Color(1,1,1,1))
	tween.tween_property(body, "modulate", Color(1,1,1,1), 0.1)
	

func _input(event : InputEvent):	
	if event.is_action_pressed("ui_cancel"):
		if not is_game_over and not is_main_menu:# and get_tree().current_scene.get_index():
			pause_game()


func respawn():
	await get_tree().create_timer(2.0).timeout
	player_health=30
	var is_game_paused=get_tree().paused
	get_tree().paused= not is_game_paused
	

func pause_game():
	var is_game_paused=get_tree().paused
	pause_pressed.emit()
	print(is_game_paused)
	get_tree().paused= not is_game_paused

func no_of_enemies():
	en_flags-=1
	if en_flags <= 0:
		game_over.emit()
	
	
