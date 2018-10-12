
extends Node

var current_level = 1

func _ready():
	bind_events()
	var savedict = file.load_game()
	if savedict != null:
		current_level = savedict["current_level"]
		pass
	randomize()
	
func bind_events():
	events.register("game_start", self)
	events.register("game_win", self)

func _exit_tree():
	save_game()
	events.unregister_node(self)

func game_start():
	var level = "res://levels/level%d/level%d.tscn" % [ current_level, current_level ]
	if load(level) == null:
		current_level = 1
		level = "res://levels/level%d/level%d.tscn" % [ current_level, current_level ]
	events.trigger("level_init", get_level())
	scene.goto_scene(level)

func game_win():
	current_level += 1
	save_game()

func save_game():
	var savedict = file.load_game()
	savedict["current_level"] = current_level
	file.save_game(savedict)

func get_level():
	return str("Niveau ", current_level)

func set_current_level(level):
	current_level = level
	save_game()