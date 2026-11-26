extends Node3D

const GRID_SIZE = 4
const CELL_SIZE = 1.0

func _ready():
	create_grid()

func create_grid():
	var material = StandardMaterial3D.new()
	material.albedo_color = Color(0.9, 0.9, 0.85)

	for i in range(GRID_SIZE + 1):
		var position = -GRID_SIZE / 2.0 + i * CELL_SIZE

		create_line(
			Vector3(0, 0.025, position),
			Vector3(GRID_SIZE, 0.025, 0.025),
			material
		)

		create_line(
			Vector3(position, 0.025, 0),
			Vector3(0.025, 0.025, GRID_SIZE),
			material
		)

func create_line(pos: Vector3, dimensions: Vector3, material):
	var line = MeshInstance3D.new()
	var mesh = BoxMesh.new()

	mesh.size = dimensions
	line.mesh = mesh
	line.position = pos
	line.material_override = material

	add_child(line)
