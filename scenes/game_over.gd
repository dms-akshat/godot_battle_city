extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/Button.grab_focus()


func _on_button_pressed():
	print('mainmenu')


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://scenes/Level_1.tscn")
