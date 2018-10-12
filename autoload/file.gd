
extends Node


func _ready():
	pass

func save_game(savedict):
    var savegame = File.new()
    savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, str("lG", OS.get_unique_ID(), "As"))
    savegame.store_line(savedict.to_json())
    savegame.close()

func load_game():
	var savegame = File.new()
	if !savegame.file_exists("user://savegame.save"):
		return #Error!  We don't have a save to load
	print(str("lG", OS.get_unique_ID(), "As"))
	savegame.open_encrypted_with_pass("user://savegame.save", File.READ, str("lG", OS.get_unique_ID(), "As"))
	var savedict = {}
	savedict.parse_json(savegame.get_line())
	savegame.close()
	return savedict