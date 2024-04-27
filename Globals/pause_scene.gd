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
	TransitionLayer.change_scene("res://scenes/Level_1.tscn")
	
	


func _on_button_3_pressed():
	Globals.pause_game()
	TransitionLayer.change_scene("res://scenes/mainmenu.tscn")
