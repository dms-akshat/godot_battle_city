extends CanvasLayer

#func _ready():
#	Globals.connect("stat_change", _on_stat_change)

func _process(delta):
	$player_health.value=Globals.player_health
	$VBoxContainer/HBoxContainer/Label.text=("x"+str(Globals.tank_destroyed))
	$VBoxContainer2/HBoxContainer2/Label.text=("x"+str(Globals.boss_tank_destroyed))
	
