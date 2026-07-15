extends CharacterBody2D
class_name Player2d1

const SPEED = 200.0
const JUMP_VELOCITY = -350.0
@onready var cooldown := $AttackCooldown
@onready var hpBar := $HUD/HPBar
@onready var goldlabel := $HUD/gold_amount
var current_interactable_obj :Node = null

func _ready() -> void: # When the player first enters the game...
	#state.enter(self) #enter the current state
	Global.load_game()
	Global.lifes = 20
	print(Global.coins)
	print(Global.lifes)
	
func update_HUD() ->void:
	hpBar.value = Global.lifes
	goldlabel.text = str(Global.coins) + "coins"
	

func _physics_process(delta: float) -> void:
	update_HUD()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Global.lifes == 0 or Global.lifes < 0:
		get_tree().reload_current_scene()
		Global.lifes += 7
	
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
