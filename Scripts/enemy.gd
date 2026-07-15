extends CharacterBody3D

enum States {attack, idle, chase, die}

var state := States.idle

var enemy_life := 2
var speed := 3.0
var accel := 10
var gravity := 10
var target : Node3D = null
const JUMP_VELOCITY = 4.5

func behaviours() ->void:
	if state == States.idle:
		velocity= Vector3.ZERO
	elif state == States.chase:
		pass
	elif state == States.attack:
		pass
	elif state == States.die:
		pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()


func _on_detection_area_body_entered(body: Node3D) -> void:
	if body is Player:
		state = States.chase


func _on_attack_area_body_entered(body: Node3D) -> void:
	if body is Player:
		state = States.attack
