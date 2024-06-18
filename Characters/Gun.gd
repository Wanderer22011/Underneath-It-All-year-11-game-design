extends Sprite2D


var rotation_speed = 20.0


func _process(delta):
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var target_angle = direction.angle()

	# Interpolate the rotation smoothly
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
