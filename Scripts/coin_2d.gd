extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Global.coins += 1
	print(Global.coins)
	queue_free()
