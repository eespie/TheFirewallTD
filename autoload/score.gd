extends Node

var score = 0
var reputation = 0
var display_score = 0
var display_reputation = 0

func _ready():
	events.register("init_score", self)
	events.register("add_score", self)
	events.register("end_level", self)

func _exit_tree():
	events.unregister_node(self)

func on_end_level():
	set_process(false)

func on_init_score(sc, rep):
	score = sc
	display_score = sc
	reputation = rep
	display_reputation = rep
	set_process(true)

func on_add_score(sc, rep):
	score += sc
	reputation += rep

func _process(deltatime):
	var delta = score - display_score
	var sig = 1
	if delta < 0:
		sig = -1
		delta = -delta
	var increment = 0
	var step = 1
	while delta > 0:
		var cur_remain = delta % (step * 10)
		if cur_remain > 0:
			increment += step
			delta -= cur_remain
		step *= 10
	display_score += increment * sig
	for score_node in get_tree().get_nodes_in_group("score"):
		score_node.set_text(str(display_score))

	delta = reputation - display_reputation
	sig = 1
	if delta < 0:
		sig = -1
		delta = -delta
	increment = 0
	step = 1
	while delta > 0:
		var cur_remain = delta % (step * 10)
		if cur_remain > 0:
			increment += step
			delta -= cur_remain
		step *= 10
	display_reputation += increment * sig
	for score_node in get_tree().get_nodes_in_group("reputation"):
		score_node.set_text(str(display_reputation))
