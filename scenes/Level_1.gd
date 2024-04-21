extends Node2D
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")

func _ready():
	Globals.connect("game_over", _on_game_over)
	#$Enemy.EnemyCharacter.connect("enemy_fire_timer", _on_enemy_fire_timer_timeout)

func _on_tank_press_shoot(direction, pos):
	print('fire recieve')
	var bullet= bullet_scene.instantiate() as Area2D
	bullet.global_position=pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.aim = direction
	$Bullets.add_child(bullet) # Replace with function body.




func _on_game_over():
	print('game over')
	Globals.is_game_over=true
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
