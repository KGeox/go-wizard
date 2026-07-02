extends CharacterBody2D


const SPEED = 50.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	

		
	move_and_slide()


func _on_detection_area_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		print(body.global_position)
