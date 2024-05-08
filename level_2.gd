extends BaseLevel

var power_up_scene:PackedScene=preload("res://scenes/power_up.tscn")

func _on_game_over():
	print('game over')
	Globals.is_game_over=true
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/level_2_game_over.tscn")


func _on_tank_container_boss_created():
	var power_up=power_up_scene.instantiate()
	var children=$SpawnLocations.get_children()
	var selected_pos=children[randi()%children.size()]
	#print(selected_pos)
	power_up.global_position=selected_pos.global_position
	$PowerUpContainer.add_child(power_up)
