extends Node2D
var bullet_scene: PackedScene= preload("res://scenes/bullet2.tscn")

func _on_tank_press_shoot(direction, pos):
	print('fire recieve')
	var bullet= bullet_scene.instantiate() as Area2D
	bullet.global_position=pos
	bullet.rotation_degrees = rad_to_deg(direction.angle()) + 90
	bullet.aim = direction
	$Bullets.add_child(bullet) # Replace with function body.
