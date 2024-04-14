extends StaticBody2D
class_name BreakableTile
@export var tilemap: TileMap
func break_tile():
	tilemap.set_cell(0,tilemap.local_to_map(global_position))
	queue_free()
