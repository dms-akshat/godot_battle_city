extends Node

var is_game_over:bool=false
var working_scene:PackedScene=preload("res://Level_1.tscn")
var player_health:int=30
signal game_over
signal pause_pressed
var score:int
var tank_destroyed:int
var player_lives:int=3


var current_scene: PackedScene

func _ready():
	process_mode=Node.PROCESS_MODE_ALWAYS



func blink_tween(body):
	var tween=get_tree().create_tween()
	tween.tween_property(body, "modulate", Color(1,1,1,0), 0.1 ).from(Color(1,1,1,1))
	tween.tween_property(body, "modulate", Color(1,1,1,1), 0.1)
	

func _input(event : InputEvent):	
	if event.is_action_pressed("ui_cancel"):
		if not is_game_over and get_tree().current_scene.get_index():
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
	
