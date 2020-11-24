extends Node

const _PATH = "res://moonphases.json"

signal moon_phase_changed

var moonphases = []
var time = 0
var speed = 1
var seconds_between_phases = 20
var current_moon_phase = 0 setget set_current_moon_phase

func _ready():
	_load_moonphases()
	emit_signal("moon_phase_changed", current_moon_phase)
	
func _process(delta):
	time += delta * speed
	_handle_moonphases()
		
func _load_moonphases():
	var file = File.new()
	file.open(_PATH, File.READ)
	var json = JSON.parse(file.get_as_text())
	file.close()
	
	moonphases = json.result["moonphases"]

func _handle_moonphases():
	if time >= seconds_between_phases:
		time -= seconds_between_phases
		current_moon_phase = fmod(current_moon_phase + 1, moonphases.size())
		emit_signal("moon_phase_changed", current_moon_phase)
		
func set_current_moon_phase(phase_index: int):
	current_moon_phase = clamp(phase_index, 0, moonphases.size() - 1)
	time = 0
	emit_signal("moon_phase_changed", current_moon_phase)
