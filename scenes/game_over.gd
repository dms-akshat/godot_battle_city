extends Control

@onready var score_label:Label=$VBoxContainer3/VBoxContainer/Label2
@onready var tank_label:Label=$VBoxContainer3/VBoxContainer4/Label4

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer2/Button.grab_focus()
	score_label.text=str(Globals.score)
	tank_label.text=str(Globals.tank_destroyed)


func _on_button_pressed():
	TransitionLayer.change_scene("res://scenes/mainmenu.tscn")


func _on_button_2_pressed():
	TransitionLayer.change_scene("res://scenes/Level_1.tscn")
	Globals.is_game_over=false
