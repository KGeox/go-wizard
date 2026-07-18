extends CharacterBody3D

enum States {attack, idle, chase, die}

var state := States.idle

var enemy_life := 2
var speed := 0.8
var accel := 10
var gravity := 10
var target : Node3D = null
const JUMP_VELOCITY = 4.5

@export var navagent : NavigationAgent3D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if enemy_life == 0:
		queue_free()
	
	if state == States.idle:
		$AnimationPlayer.play("idle")
		velocity= Vector3.ZERO
		
	elif state == States.chase:
		$AnimationPlayer.play("idle")
		
		
		navagent.target_position = target.global_position
		
		var direction := navagent.get_next_path_position() - global_position
		direction.normalized()
		 
		velocity = velocity.lerp(direction * speed, accel * delta)
		 
	elif state == States.attack:
		$AnimationPlayer.play("en_attack")

	elif state == States.die: 
		pass
		
	move_and_slide()
 
func _on_detection_area_body_entered(body: Node3D) -> void:
	print("working")
	if body is Player:
		target = body
		print("chasing")
		state = States.chase

func _on_attack_area_body_entered(body: Node3D) -> void:
	if body is Player:
		state = States.attack


func _on_detection_area_body_exited(body: Node3D) -> void:
	if body is Player:
		state = States.idle

func _on_attack_area_body_exited(body: Node3D) -> void:
	state = States.chase
	$AnimationPlayer.stop()



func _on_damageablebody_body_entered(body: Node3D) -> void:
	print("hmm")
	if body is Sword:
		print("sword detected")
		print(enemy_life)
		enemy_life -=1
