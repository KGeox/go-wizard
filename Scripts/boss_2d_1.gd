extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0
var player : Player2d1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if player:
		print("ok")
		var direction := (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		
	move_and_slide()
