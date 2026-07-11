extends CharacterBody2D
class_name Player2d1

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

var current_interactable_obj :Node = null

func _ready() -> void: # When the player first enters the game...
	#state.enter(self) #enter the current state
	Global.load_game()
	print(Global.coins)
	print(Global.lifes)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if current_interactable_obj != null:
		if Input.is_action_just_pressed("interact"):
			current_interactable_obj.interact()

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
