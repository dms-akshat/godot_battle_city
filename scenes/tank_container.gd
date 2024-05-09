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
#@onready var enemy = enemy_scene.instantiate()
#@export var Spawn_Markers: Node2D
#@onready var Spawn_Markers:Node2D=get_node("$../SpawnLocations")
#var max_tank:int=5
#var can_spawn:bool=true

# Called when the node enters the scene tree for the first time.
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
	#$Timer2.start()
	#can_spawn=true
	n=Globals.tank_destroyed/5
	print(Globals.tank_destroyed)
	
	if $".".get_child_count()<6+n:
		$Timer2.start()
		#can_spawn=false
		var enemy = enemy_scene.instantiate()
		var children=$"../SpawnLocations".get_children()
		var selected_pos=children[randi()%children.size()]
		print(selected_pos)
		enemy.global_position=selected_pos.global_position
		$".".add_child(enemy)
	
	if Globals.tank_destroyed>=10 and can_boss_enemy:
		var boss_enemy=boss_enemy_scene.instantiate()
		var children=$"../SpawnLocations".get_children()
		var selected_pos=children[randi()%children.size()]
		print(selected_pos)
		boss_enemy.global_position=selected_pos.global_position
		$".".add_child(boss_enemy)
		can_boss_enemy=false
		boss_created.emit()
		
