extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	

func interact() ->void:
	print("You opened the coffer")
	$StaticBody3D/AnimationPlayer.play("openCoffer")


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.current_interactable_obj = self
		print("you Entered the coffer zone")


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		if body.current_interactable_obj == self:
			body.current_interactable_obj =null
			print("You went out")
