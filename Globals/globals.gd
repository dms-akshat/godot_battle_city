extends Node

var is_game_over:bool=false

var player_health:int=30
signal game_over
signal pause_pressed
var score:int
var tank_destroyed:int
var player_lives:int=3
#var pause_scene
#var is_game_paused:bool:
#	get:
#		return is_game_paused
#	set(value):
#		is_game_paused=value
	
var current_scene: PackedScene

func _ready():
	process_mode=Node.PROCESS_MODE_ALWAYS
	
	#pause_scene=PauseScene.instantiate()
	#add_child(pause_scene)
	



func blink_tween(body):
	var tween=get_tree().create_tween()
	tween.tween_property(body, "modulate", Color(1,1,1,0), 0.1 ).from(Color(1,1,1,1))
	tween.tween_property(body, "modulate", Color(1,1,1,1), 0.1)
	

func _input(event : InputEvent):
	if event.is_action_pressed("ui_cancel"):
		#is_game_paused=get_tree().paused
		#if not PauseScene.visible:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
		#	PauseScene.visible=true
		#else:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
		#	PauseScene.visible=false
		#pause_pressed.emit()
		pause_game()
		
		#TransitionLayer.change_scene("res://scenes/pause_scene.tscn")

func respawn():
	await get_tree().create_timer(2.0).timeout
	var is_game_paused=get_tree().paused
	get_tree().paused= not is_game_paused
	

func pause_game():
	var is_game_paused=get_tree().paused
	pause_pressed.emit()
	print(is_game_paused)
	#if not PauseScene.visible:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
	#	PauseScene.visible=true
		#var pause_scene=PauseScene.instantiate()
		#pause_scene.VBoxContainer2/Button.grab_focus()
	#	pause_pressed.emit()
	#else:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
	#	PauseScene.visible=false
	get_tree().paused= not is_game_paused
	
