extends CharacterBody2D

var SPEED = 200

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	move_and_slide()
	if(Input.is_action_pressed("ui_left")):
		velocity = Vector2(-SPEED, 0)
		rotation_degrees = 270
	if(Input.is_action_pressed("ui_right")):
		velocity = Vector2(SPEED, 0)
		rotation_degrees = 90
	if(Input.is_action_pressed("ui_up")):
		velocity = Vector2(0, -SPEED) 
		rotation_degrees = 0
	if(Input.is_action_pressed("ui_down")):
		velocity = Vector2(0, SPEED)
		rotation_degrees = 180
	if(Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down") || Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right")):
		velocity = Vector2(0,0)
