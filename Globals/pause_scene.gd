extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	hide()
	Globals.connect("pause_pressed", _on_pause_pressed)
	#if visible:
		
func _on_pause_pressed():
	if not visible:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
		show()
		$VBoxContainer2/Button.grab_focus()
		#var pause_scene=PauseScene.instantiate()
		#pause_scene.VBoxContainer2/Button.grab_focus()
		#pause_pressed.emit()
	else:
		#	print("Pause_scene:")
		#	print(PauseScene.visible)
		hide()

func _on_button_pressed():
	#Globals.is_game_paused=get_tree().paused
	#print(Globals.is_game_paused)
	#TransitionLayer.change_scene("res://scenes/Level_1.tscn")
	#await get_tree().create_timer(2.0).timeout
	#hide()
	Globals.pause_game()


func _on_button_2_pressed():
	Globals.pause_game()
	TransitionLayer.change_scene("res://scenes/Level_1.tscn")
	
	


func _on_button_3_pressed():
	Globals.pause_game()
	TransitionLayer.change_scene("res://scenes/mainmenu.tscn")
