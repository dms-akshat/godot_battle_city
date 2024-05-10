extends BaseLevel

func _on_tank_spawn_tank_spawn():
	var spawn_locations=get_node("SpawnLocations")
	var children=spawn_locations.get_children()
	var enemy=spawn_scene.instantiate()
	var selected_pos=children[randi()%children.size()]
	if $Tank_spawn.get_child_count()<=6 :
		$Tank_spawn.add_child(enemy)
		enemy.global_position=selected_pos.global_position
