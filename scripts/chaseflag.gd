class_name pathfinding
extends CharacterBody2D

@export var target : Node2D


var speed = 40.0
var accleration = 50.0

@onready var navigation_agent = $navigation/NavigationAgent2D 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	
	velocity = velocity.lerp( direction*speed , accleration*delta )
	move_and_slide()
