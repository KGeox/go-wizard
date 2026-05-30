class_name WalkPlayerState
extends BasePLayerState

func enter(player: Player) -> void:
	player.anim_tree.set("parameters/movement/transition_request", "walk" )
	
func pre_update(player: Player)-> void:
	var current_speed := player.get_current_speed()
	
	if Input.is_action_just_pressed("jump"):
		player.change_state_to(PlayerStates.JUMP)
	if current_speed == 0:
		player.change_state_to(PlayerStates.IDLE)
	elif current_speed > player.run_speed:
		player.change_state_to(PlayerStates.RUN)
	
func update(player:Player, delta: float) -> void:
 
	var direction := player.get_move_input()
	player.update_velocity_using_direction(direction)
	player.move_and_slide()
	player.turn_to(direction)
	
	var walk_speed:=lerpf(0.5, 1.75, player.get_current_speed() / player.run_speed   )
	player.anim_tree.set("parameters/walk_speed/scale", walk_speed )
