class_name Player 
extends CharacterBody3D
## Determining how fast the player  moves
@export var base_speed := 5.0
const JUMP_VELOCITY = 9
@onready var camera: Node3D = $SpringArm3D/Camera3D
@onready var anim_player: AnimationPlayer = $Mesh/AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree
var last_lean := 0.0

##Speed of running player
var run_speed := 3.5  

## default speed used to blend animations
const BLEND_SPEED := 0.2


## The current state that our player is in.
var state: BasePLayerState = PlayerStates.IDLE

func _ready() -> void:
	add_to_group("player")
	state.enter(self)

## Changes the current player state and runs the correct function
func change_state_to(next_state: BasePLayerState) -> void:
	state.exit(self)
	state = next_state
	state.enter(self)

func _physics_process(delta: float) -> void:
	state.pre_update(self)
	state.update(self, delta)


#Body moves with camera
func turn_to(direction: Vector3) ->void:
	if direction.length()>0:
		var yaw:= atan2(-direction.x, -direction.z)
		yaw = lerp_angle(rotation.y, yaw, .25)
		rotation.y = yaw
		

func get_move_input() -> Vector3:
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (camera.global_basis * Vector3(input_dir.x, 0, input_dir.y))
	direction = Vector3(direction.x, 0,direction.z).normalized() * input_dir.length()
	return direction
	
	
func get_current_speed() -> float:
	return velocity.length()
	
## Apply velocity based on directional movement.
func update_velocity_using_direction(direction: Vector3,speed: float = base_speed ) -> void:
	if direction:  
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		
