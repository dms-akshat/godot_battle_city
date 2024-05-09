extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$player_health.value=Globals.player_health
	$no_of_flags.value=Globals.en_flags

