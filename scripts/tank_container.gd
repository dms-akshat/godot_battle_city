extends Node2D

var enemy_scene:PackedScene=preload("res://scenes/Enemy.tscn")
var boss_enemy_scene:PackedScene=preload("res://scenes/enemy_boss.tscn")
var can_boss_enemy:bool=false
var n:int:
	set(value):
		if value>n*2:
			can_boss_enemy=true
		n=value
signal boss_created

func _ready():
	var enemy = enemy_scene.instantiate()
	var children=$"../SpawnLocations".get_children()
	var selected_pos=children[randi()%children.size()]
	enemy.global_position=selected_pos.global_position
	$".".add_child(enemy)
	$Timer2.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	n=Globals.tank_destroyed/5
	if $".".get_child_count()<6+n:
		$Timer2.start()
		var enemy = enemy_scene.instantiate()
		var children=$"../SpawnLocations".get_children()
		var selected_pos=children[randi()%children.size()]
		enemy.global_position=selected_pos.global_position
		$".".add_child(enemy)
		
	if Globals.tank_destroyed>=10 and can_boss_enemy:
		var boss_enemy=boss_enemy_scene.instantiate()
		var children=$"../SpawnLocations".get_children()
		var selected_pos=children[randi()%children.size()]
		boss_enemy.global_position=selected_pos.global_position
		$".".add_child(boss_enemy)
		can_boss_enemy=false
		boss_created.emit()
		
