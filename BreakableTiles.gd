extends StaticBody2D
class_name BreakableTile
var count:int =0
@export var tilemap: TileMap

func _ready():
	$Sprite2D.hide()

func break_tile():
	print(count)
	count+=1
	if count==1:
		$Sprite2D.show()
	#print(global_position)
	var pos=tilemap.local_to_map(global_position)
	#print(pos)
	#pos.x=pos.x+2
	#pos.y=pos.y+1
	#tilemap.erase_cell(0,pos)
	if count >=2:
		tilemap.set_cell(0, pos,-1, Vector2i(-1,-1),-1)
		queue_free()
