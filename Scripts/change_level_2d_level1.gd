extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		body.current_interactable_obj = self
		print("you Entered")


func _on_body_exited(body: Node2D) -> void:
	if body is Player2d1:
		if body.current_interactable_obj == self:
			body.current_interactable_obj =null
			print("You went out")
			
func interact() -> void:
	get_tree().change_scene_to_file("res://Scenes/2D_Levels/2DLevel.tscn")
	Global.save_game()
