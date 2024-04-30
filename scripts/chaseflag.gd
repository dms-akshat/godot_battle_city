class_name chaseflag
extends State

@export var target : Node2D
#target is flag

var speed = 40.0
var accleration = 50.0

#@onready var navigation_agent = $navigation/NavigationAgent2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.ZERO
	var default_2d_map_rid: RID = get_world_2d().get_navigation_map()
	var start_position: Vector2 = Vector2(0.0, 0.0)
	var target_position: Vector2 = target.global_position
	var path: PackedVector2Array = NavigationServer2D.map_get_path(
	default_2d_map_rid,
	start_position,
	target_position,
	true
	)
	#movement through the navigationserver
	
