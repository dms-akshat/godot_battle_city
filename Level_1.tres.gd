extends Node2D
var spawn_scene=preload("res://scenes/Enemy.tscn")
var positions=$SpawnLocations.get_children()
func _on_tank_spawn_tank_spawn():
	var enemy=spawn_scene.instantiate()
	var selected_position=positions[randi()%positions.size()]
	enemy.position=selected_position.global_position
	$TankSpawn.add_child(enemy)
	
