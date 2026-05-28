class_name BasePLayerState
extends RefCounted

## Called when we first enter this state
func enter(player: Player) -> void:
	pass
	

## Called when we exit a state
func exit(player: Player) -> void:
	pass
	
##Called before updateis called, allowws for state changes
func pre_update(player: Player)-> void:
	pass

## Called for every physics frame that we're in this state
func update(player:Player, delta: float) -> void:
	pass
