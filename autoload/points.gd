
extends Node

var bonus = 0
var recon_soldiers = 0
var recon_soldiers_lost = 0
var remain_time = 0
var is_lost = true
var total_score = 0
var cur_level
var savedict
var best_score

func _ready():
	bind_events()
	
func bind_events():
	events.register("points_bonus_add", self)
	events.register("recon_soldier_count", self)
	events.register("game_lost", self)
	events.register("game_win", self)
	events.register("time_remaining", self)
	events.register("recon_soldier_lost", self)
	events.register("level_init", self)
	
func _exit_tree():
	events.unregister_node(self)

func level_init(level_name):
	cur_level = level_name
	bonus = 0
	recon_soldiers = 0
	recon_soldiers_lost = 0
	remain_time = 0
	is_lost = true
	total_score = 0
	savedict = file.load_game()
	best_score = savedict[cur_level]
	if best_score == null:
		best_score = 0

func points_bonus_add(points):
	bonus += points

func recon_soldier_count(soldiers):
	recon_soldiers = soldiers

func game_lost():
	bonus = 0

func game_win():
	is_lost = false
	if total_score > best_score:
		savedict[cur_level] = total_score
		file.save_game(savedict)

func time_remaining(time):
	if not is_lost:
		remain_time = time

func recon_soldier_lost():
	recon_soldiers_lost += 1

func update_total_score():
	if not is_lost:
		total_score = bonus + (recon_soldiers - recon_soldiers_lost) * 100 + remain_time * 10
	return total_score