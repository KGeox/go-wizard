extends StaticBody2D

@export var pos := Vector2()
@onready var anim_player: AnimationPlayer = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_detection_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		print("detected")
		anim_player.play("move_bk")



func _on_damage_body_entered(body: Node2D) -> void:
	if body is Player2d1:
		Global.lifes -=1
		print(Global.lifes)
