extends Control
var velocity: int

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	position.y=648
	velocity=500
	#pos=648
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(position.y)
	if(position.y<0):
		velocity=0
		
	position+=Vector2.UP*velocity*delta
	

	#pass


func _on_start_pressed():
	print('change scene1')
	#pass # Replace with function body.


func _on_options_pressed():
	print('change scene2')
	#pass # Replace with function body.
