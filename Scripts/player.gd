class_name Player # naming my script for others 
extends CharacterBody3D # saying what type of node it is controlling



## Determining how fast the player  moves
@export var base_speed := 5.0
const JUMP_VELOCITY = 9

var current_interactable_obj :Node = null

#at the start of the game import this nodes for me to control them
@onready var camera: Node3D = $SpringArm3D/Camera3D
@onready var anim_player: AnimationPlayer = $Mesh/AnimationPlayer
@onready var anim_tree: AnimationTree = $AnimationTree

var last_lean := 0.0

##Speed of running player
var run_speed := 3.5  

## default speed used to blend animations
const BLEND_SPEED := 0.2


## The current(for now 1st) state that our player is in.
var state: BasePLayerState = PlayerStates.IDLE

func _ready() -> void: # When the player first enters the game...
	state.enter(self) #enter the current state

## Changes the current player state and runs the next state
func change_state_to(next_state: BasePLayerState) -> void:
	state.exit(self) #exit previous state
	state = next_state # load next state
	state.enter(self) # enter the next state

func _physics_process(delta: float) -> void: # run all instructions in here 60 times per second
	state.pre_update(self) # in the state where you are do you do you have to change?
	state.update(self, delta) # do what your state tells you to do


#Body moves with camera
func turn_to(direction: Vector3) ->void:
	if direction.length()>0: # If you have a direction (a new unprocessed one)
		var yaw:= atan2(-direction.x, -direction.z) #calculate direction angle
		yaw = lerp_angle(rotation.y, yaw, .25) #make rotation smooth
		rotation.y = yaw # rotate in ref to y(up unchanged)
		

#Get the input to move
func get_move_input() -> Vector3:
	var input_dir := Input.get_vector("left", "right", "forward", "backward")#this movement are defined in the input map
	var direction := (camera.global_basis * Vector3(input_dir.x, 0, input_dir.y)) # calculating direction according to where camera is looking
	direction = Vector3(direction.x, 0,direction.z).normalized() * input_dir.length() #putting direction in x and z 
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
		
