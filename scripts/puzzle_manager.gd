extends Node

@export var cube_1: RigidBody3D
@export var cube_2: RigidBody3D
@export var sphere_1: RigidBody3D

@export var target_cube_1: Marker3D
@export var target_cube_2: Marker3D
@export var target_sphere_1: Marker3D
@export var victory_label: Label

var completed: bool = false

func _process(_delta):
	if completed:
		return

	if check_solution():
		completed = true
		print("Puzzle solved!")
		
		if victory_label != null:
			victory_label.visible = true

func check_solution() -> bool:
	return (
		is_at_target(cube_1, target_cube_1)
		and is_at_target(cube_2, target_cube_2)
		and is_at_target(sphere_1, target_sphere_1)
	)

func is_at_target(obj: RigidBody3D, target: Marker3D) -> bool:
	if obj == null or target == null:
		return false

	var object_position = Vector2(obj.global_position.x, obj.global_position.z)
	var target_position = Vector2(target.global_position.x, target.global_position.z)

	return object_position.distance_to(target_position) < 0.3
