extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed: int = 200
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 200
	position.y = 120
	direction = get_random_direction()

func get_random_direction() -> Vector2:
	var directions = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]
	var rand_index = randi() % directions.size()
	return directions[rand_index]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction*speed
	%EnemySprite.look_at(velocity + %EnemySprite.global_position)
	move_and_slide()
	
func _on_direction_timer_timeout():
	direction = get_random_direction() # Replace with function body.
	%DirectionTimer.start()
