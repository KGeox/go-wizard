extends SpringArm3D

@onready var camera: Camera3D = $Camera3D
#Speed of turning camera
@export var turn_rate:= 200
@export var mouse_sensitivity:= .5
var mouse_input : Vector2 = Vector2()
@onready var player: Node3D = get_parent()
var camera_rig_height: float = position.y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spring_length = camera.position.z
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#configure camera position
	var look_input:= Input.get_vector("view_left","view_right", "view_up", "view_down")
	#Make the camera to widely move
	look_input = turn_rate * look_input * delta
	look_input += mouse_input
	mouse_input = Vector2()
	
	rotation_degrees.x -= look_input.y
	rotation_degrees.y -= look_input.x
	#the max rotation of the camera
	rotation_degrees.x = clampf(rotation_degrees.x,-70,50)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_input = event.relative * mouse_sensitivity
	elif event is InputEventKey and event.keycode == KEY_ESCAPE and event.pressed:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED       
	
func _physics_process(delta: float) -> void:
	position = player.position + Vector3(0,camera_rig_height, 0)
	
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
