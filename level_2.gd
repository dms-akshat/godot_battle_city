extends BaseLevel
var health_power_up_scene:PackedScene=preload("res://scenes/health_power_up.tscn")
var power_up_scene:PackedScene=preload("res://scenes/power_up.tscn")

func _ready():
	Globals.connect("game_over", _on_game_over)
	Globals.connect("boss_destroyed", _on_boss_destroyed)
	Globals.score=0
	Globals.player_health=100

func _on_game_over():
	print('game over')
	Globals.is_game_over=true
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/level_2_game_over.tscn")


func _on_tank_container_boss_created():
	var power_up=power_up_scene.instantiate()
	var children=$SpawnLocations.get_children()
	var selected_pos=children[randi()%children.size()]
	power_up.global_position=selected_pos.global_position
	$PowerUpContainer.add_child(power_up)
	
func _on_boss_destroyed(pos):
	var power_up=health_power_up_scene.instantiate()
	power_up.global_position=pos
	$PowerUpContainer.add_child(power_up)
