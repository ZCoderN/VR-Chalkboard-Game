extends Node3D

@export var sensitivity: float = 0.003
@export var min_pitch: float = -0.3
@export var max_pitch: float = 1.0

var yaw: float = 0.0
var pitch: float = 0.3
var rotating: bool = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			rotating = event.pressed

	if event is InputEventMouseMotion and rotating:
		yaw -= event.relative.x * sensitivity
		pitch -= event.relative.y * sensitivity

		pitch = clamp(pitch, min_pitch, max_pitch)

		rotation.y = yaw
		rotation.x = pitch
