extends Node2D
class_name BaseLevel
var spawn_scene=preload("res://scenes/tank_spawn.tscn")
var bullet_scene: PackedScene=preload("res://scenes/bullet2.tscn")
var player_bullet_scene: PackedScene=preload("res://scenes/player_bullet.tscn")
var player2_bullet_scene: PackedScene=preload("res://scenes/player2_bullet.tscn")
#func _ready():
	#get_viewport().size = Vector2(5000,3000)  # Adjust the size as needed

func _ready():
	Globals.connect("game_over", _on_game_over)
	#Globals.player_health=40

func _process(delta):
	pass
	



func _on_tank_press_shoot(direction, pos):
	#print("Fire receive")
	var bullet=player_bullet_scene.instantiate() as Area2D
	bullet.global_position=pos
	bullet.rotation_degrees=rad_to_deg(direction.angle())
	bullet.aim=direction
	$Bullets.add_child(bullet)

func _on_tank2_press_shoot(direction, pos):
	var bullet=player2_bullet_scene.instantiate() as Area2D
	bullet.global_position=pos
	bullet.rotation_degrees=rad_to_deg(direction.angle())
	bullet.aim=direction
	$Bullets.add_child(bullet)

func _on_game_over():
	print('game over')
	Globals.is_game_over=true
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
