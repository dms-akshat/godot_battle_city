extends StaticBody2D

var health:int=20

func enemy_hit():
	if health>0:
		health-=10
		Globals.blink_tween($Sprite2D)
	if health<=0:
		Globals.score+=100
		queue_free()
		Globals.no_of_enemies()
		
