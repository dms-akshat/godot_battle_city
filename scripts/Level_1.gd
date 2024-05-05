extends Node2D
var spawn_scene=preload("res://scenes/tank_spawn.tscn")
func _process(delta):
	pass
'''func _on_tank_spawn_tank_spawn():
	if $TankSpawn.get_child_count()<=5:
		var spawn_locations= get_node("SpawnLocations")
		var children = $spawn_locations.get_children()
		var selected_position=children[randi() % children.size()]
		var enemy=spawn_scene.instantiate()
		enemy.position=selected_position
		$TankSpawn.add_child(enemy)'''
