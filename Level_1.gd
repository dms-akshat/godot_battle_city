extends Node2D
var spawn_scene=preload("res://tank_spawn.tscn")
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")

func _on_tank_press_shoot(direction, pos):
	print('fire recieve')
	var bullet= bullet_scene.instantiate() as Area2D
	bullet.global_position=pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.aim = direction
	$Bullets.add_child(bullet) # Replace with function body.

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
