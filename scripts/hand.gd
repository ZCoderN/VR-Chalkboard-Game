extends CharacterBody3D

@export var speed: float = 1.0

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_key_pressed(KEY_W):
		direction.z -= 1
	if Input.is_key_pressed(KEY_S):
		direction.z += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1

	direction = direction.normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	velocity.y = 0

	move_and_slide()

	global_position.x = clampf(global_position.x, -1.8, 1.8)
	global_position.z = clampf(global_position.z, -1.8, 1.8)
	global_position.y = 0.3

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var object = collision.get_collider()

		if object is RigidBody3D:
			var push_direction = Vector3(
				velocity.x, 0, velocity.z
			)

			if push_direction.length() > 0:
				object.apply_central_impulse(
					push_direction * 0.05
				)
