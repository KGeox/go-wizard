extends RigidBody2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_detection_body_entered(body: Node2D) -> void:
	if body == Player2d1:
		print("detected")


func _on_damage_body_entered(body: Node2D) -> void:
	if body == Player2d1:
		print("-1 life")
