extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var DetectionArea := $DetectionArea

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()


func _on_time_to_detect_timeout() -> void:
	var player := get_tree().get_first_node_in_group("player")
	var detected :Array[Node3D] = DetectionArea.get_overlapping_bodies()
	if player in detected:
		velocity.x = move_toward(velocity.x, 10, SPEED)
