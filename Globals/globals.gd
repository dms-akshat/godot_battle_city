extends Node

var is_game_over:bool=false
var player_health:int=30
signal game_over

func blink_tween(body):
	var tween=get_tree().create_tween()
	tween.tween_property(body, "modulate", Color(1,1,1,0), 0.1 )
	tween.tween_property(body, "modulate", Color(1,1,1,1), 0.1)
	
