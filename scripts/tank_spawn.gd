extends Node2D
var enemy_spawn=preload("res://scenes/Enemy.tscn")
signal tank_spawn()
func _ready():
	$Timer.start()
func _on_timer_timeout():
		tank_spawn.emit()

