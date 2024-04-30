#IDLE FUNC
class_name wanderingenemy
extends State

@export var actor: Node
@export var animator: Sprite2D

signal attack_flag
signal found_player

func _ready():
	set_physics_process(false)

func _enter_state() -> void:
	set_physics_process(true)
	animator.play("move")
	if actor.velocity == Vector2.ZERO:
		actor.velocity = Vector2.RIGHT.rotated(randf_range(0, TAU)) * actor.max_speed

func _exit_state() -> void:
	set_physics_process(false)

func _physics_process(delta):
	
	
	actor.velocity = actor.velocity.move_toward(actor.velocity.normalized() * actor.max_speed, actor.acceleration * delta)
	var collision = actor.move_and_collide(actor.velocity * delta)
	if collision:
		var bounce_velocity = actor.velocity.bounce(collision.get_normal())
		actor.velocity = bounce_velocity
	#logic through range from the player
		found_player.emit()
		#logic through a timer to attack player flag 
		attack_flag.emit()
	
