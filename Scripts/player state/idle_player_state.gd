class_name IdlePlayerState
extends BasePLayerState



func enter(player: Player) -> void:
	player.anim_tree.set("parameters/movement/transition_request", "idle" )

func pre_update(player: Player)-> void:
	var direction := player.get_move_input()
	
	if not player.is_on_floor():
		player.change_state_to(FallPlayerState.new())
	#elif current_speed > player.run_speed:
		#player.change_state_to(PlayerStates.RUN)
	elif direction.length() > 0.0:
		player.change_state_to(PlayerStates.WALK)
	elif Input.is_action_just_pressed("jump"):
		player.change_state_to(PlayerStates.JUMP)

 
