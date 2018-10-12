extends Node

onready var packet = load("res://scenes/packets/packet.tscn")

func _ready():
	pass

func get_http_req(target):
	var pkt = packet.instance()
	pkt.set_size(0.35)
	pkt.set_data_score(5, 1)
	pkt.strength = 0.1
	pkt.pulse_speed = 1.0
	pkt.packet_speed = 30
	pkt.color_out = Color(0.2, 1.0, 0.2)
	pkt.color_in = Color(0.0, 1.0, 0.0)
	pkt.target = target
	pkt.protocol = "http"
	pkt.type = "req"
	pkt.threat = "none"
	return pkt
	
func get_http_rep(target):
	var pkt = packet.instance()
	pkt.set_size(0.4)
	pkt.set_data_score(10, 2)
	pkt.strength = 0.2
	pkt.pulse_speed = 1.0
	pkt.packet_speed = 30
	pkt.color_out = Color(0.2, 1.0, 0.2)
	pkt.color_in = Color(0.0, 1.0, 0.0)
	pkt.target = target
	pkt.protocol = "http"
	pkt.type = "rep"
	pkt.threat = "none"
	return pkt

func get_http_req_virus(target):
	var pkt = get_http_req(target)
	pkt.set_data_score(1, 10)
	pkt.color_in = Color(1.0, 0.0, 0.0)
	pkt.threat = "virus"
	return pkt

func get_http_rep_virus(target):
	var pkt = get_http_rep(target)
	pkt.set_data_score(1, 10)
	pkt.color_in = Color(1.0, 0.0, 0.0)
	pkt.threat = "virus"
	return pkt

func get_smtp_req(target):
	var pkt = packet.instance()
	pkt.set_size(0.35)
	pkt.set_data_score(5, 1)
	pkt.strength = 0.1
	pkt.pulse_speed = 1.0
	pkt.packet_speed = 30
	pkt.color_out = Color(1.0, 1.0, 0.2)
	pkt.color_in = Color(1.0, 1.0, 0.0)
	pkt.target = target
	pkt.protocol = "smtp"
	pkt.type = "req"
	pkt.threat = "none"
	return pkt
	
func get_smtp_rep(target):
	var pkt = packet.instance()
	pkt.set_size(0.4)
	pkt.set_data_score(10, 2)
	pkt.strength = 0.2
	pkt.pulse_speed = 1.0
	pkt.packet_speed = 30
	pkt.color_out = Color(1.0, 1.0, 0.2)
	pkt.color_in = Color(1.0, 1.0, 0.0)
	pkt.target = target
	pkt.protocol = "smtp"
	pkt.type = "rep"
	pkt.threat = "none"
	return pkt
