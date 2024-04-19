extends Node2D
var spawn_scene=preload("res://scenes/tank_spawn.tscn")
func _process(delta):
	pass
func _on_tank_spawn_tank_spawn():
	var spawn_locations=get_node("SpawnLocations")
	var children=spawn_locations.get_children()
	var enemy=spawn_scene.instantiate()
	var selected_pos=children[randi()%children.size()]
	if $Tank_spawn.get_child_count()<=5:
		$Tank_spawn.add_child(enemy)
		enemy.position=selected_pos.global_position
