extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func interact() ->void:
	get_tree().change_scene_to_file("res://2D_Screens/END.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	Global.save_game()


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.current_interactable_obj = self
		print("you Entered")


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		if body.current_interactable_obj == self:
			body.current_interactable_obj =null
			print("You went out")
