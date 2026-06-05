extends Node

@export var coins := 0

func save_game() -> void:
	var save_data := {
		"coins": coins
	}
	var file := FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_text :=JSON.stringify(save_data)
	file.store_line(json_text)

func load_game() ->void:
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var file :=FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_text := file.get_line()
	var json := JSON.new()
	var parse_result := json.parse(json_text)
	
	if parse_result == OK:
		var data :Dictionary= json.get_data()
		coins = data["coins"]
