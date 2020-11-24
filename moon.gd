extends Node2D

onready var moon_sprite = $AnimatedSprite

func _ready():
	TimeMachine.connect("moon_phase_changed", self, "_set_moon_frame")


func _set_moon_frame(frame_index):
	moon_sprite.frame = frame_index
