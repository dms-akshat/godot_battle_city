extends GameOver

@onready var boss_tank_label:Label=$VBoxContainer3/VBoxContainer5/Label4

func _ready():
	$VBoxContainer2/Button.grab_focus()
	score_label.text=str(Globals.score)
	tank_label.text=str(Globals.tank_destroyed)
	boss_tank_label.text=str(Globals.boss_tank_destroyed)
	

func _on_button_2_pressed():
	TransitionLayer.change_scene("res://level_2.tscn")
	Globals.is_game_over=false
	Globals.score=500
	Globals.tank_destroyed=0
	Globals.en_flags=3
