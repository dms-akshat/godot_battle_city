extends StaticBody2D

var health:int=30

func hit():
	if health>0:
		health-=10
		Globals.blink_tween($Sprite2D)
	if health<=0:
		queue_free()
