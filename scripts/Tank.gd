extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	set_velocity(Vector2(0,0))
	move_and_slide()
	if(Input.is_action_pressed("ui_right")):
		velocity.x = 20
		print(velocity)
