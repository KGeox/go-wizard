extends Node

# Creating new instances of diff states
var IDLE := IdlePlayerState.new()
var FALL := FallPlayerState.new()
var RUN := RunPlayerState.new()
var WALK := WalkPlayerState.new()
var JUMP := JumpPlayerState.new()
