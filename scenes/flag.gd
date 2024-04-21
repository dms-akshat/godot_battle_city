extends StaticBody2D

var flag_health:int=30


func hit():
	if flag_health>0:
		flag_health-=10
		Globals.blink_tween($Sprite2D)
	if flag_health<=0:
		Globals.game_over.emit()




	
