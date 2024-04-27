extends Node2D
var spawn_scene=preload("res://tank_spawn.tscn")
func _process(delta):
	pass
func _on_tank_spawn_tank_spawn():
	var spawn_locations= get_node("SpawnLocations")
	print(spawn_locations)
	var children = spawn_locations.get_children()
	var enemy=spawn_scene.instantiate()
	var selected_position=children[randi()%children.size()]
	if $TankSpawn.get_child_count()<=5:
		$TankSpawn.add_child(enemy)
		enemy.position=selected_position.global_position
