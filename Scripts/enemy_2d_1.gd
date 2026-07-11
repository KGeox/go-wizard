extends CharacterBody2D


@export var speed := 25.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_wall():
		speed = -speed
	
	velocity.x = speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		Global.lifes -= 1
		print(Global.lifes)


func _on_kill_enemy_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		queue_free()
