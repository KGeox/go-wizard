extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		body.current_interactable_obj = self
		print("you Entered")
		get_node("CollisionShape3D/MeshInstance3D2").show()


func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		if body.current_interactable_obj == self:
			body.current_interactable_obj =null
			print("You went out")
			get_node("CollisionShape3D/MeshInstance3D2").hide()
		

func interact() ->void:
	get_tree().change_scene_to_file("res://Scenes/level2.tscn")
	Global.save_game()
	
