class_name FallPlayerState
extends BasePLayerState

func enter(player: Player) -> void:
	player.anim_tree.set("parameters/movement/transition_request", "fall" )
	
func pre_update(player: Player)-> void:
	if player.is_on_floor():
		player.change_state_to(PlayerStates.IDLE)

func update(player:Player, delta: float) -> void:
	var direction := player.get_move_input()
	
	player.velocity += player.get_gravity() * delta
	player.update_velocity_using_direction( direction, player.base_speed  )
	player.move_and_slide()
	player.turn_to(direction)
