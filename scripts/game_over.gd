extends Control
class_name GameOver

@onready var score_label:Label=$VBoxContainer3/VBoxContainer/Label2
@onready var tank_label:Label=$VBoxContainer3/VBoxContainer4/Label4

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/Button.grab_focus()
	score_label.text=str(Globals.score)
	tank_label.text=str(Globals.tank_destroyed)


func _on_button_pressed():
	TransitionLayer.change_scene("res://scenes/mainmenu.tscn")
	Globals.is_main_menu=true
	Globals.score=500
	Globals.tank_destroyed=0
	Globals.en_flags=3
	Globals.player_health=40
	Globals.is_mode_2=false


func _on_button_2_pressed():
	TransitionLayer.change_scene("res://Level_1.tscn")
	Globals.is_game_over=false
	Globals.score=500
	Globals.tank_destroyed=0
	Globals.en_flags=3
