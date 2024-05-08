extends CanvasLayer

func _ready():
	hide()
	Globals.connect("pause_pressed", _on_pause_pressed)
	
func _on_pause_pressed():
	if not visible:
		show()
		$VBoxContainer2/Button.grab_focus()
	else:
		hide()

func _on_button_pressed():
	Globals.pause_game()


func _on_button_2_pressed():
	Globals.pause_game()
	Globals.score=500
	Globals.tank_destroyed=0
	Globals.en_flags=3
	Globals.player_health=40
	TransitionLayer.change_scene("res://scenes/Level_1.tscn")
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
	
	


func _on_button_3_pressed():
	Globals.pause_game()
	Globals.score=500
	Globals.tank_destroyed=0
	Globals.en_flags=3
	Globals.player_health=40
	TransitionLayer.change_scene("res://scenes/mainmenu.tscn")
	Globals.is_main_menu=true
