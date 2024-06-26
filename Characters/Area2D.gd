extends Node2D

@onready var bullet_scence = preload("res://Characters/bullet.tscn")
@onready var gun_point = $Gun
# Speed of rotation
var rotation_speed = 20.0


func _process(delta):
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var target_angle = direction.angle()
	if Input.is_action_just_pressed("Shoot"):
		shoot(direction)
	
	# Interpolate the rotation smoothly
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)

func shoot(direction):
	var bullet_instance = bullet_scence.instance()
	bullet_instance.position= gun_point.global_position
	bullet_instance.velocity = direction* bullet_instance.speed
	get_parent().add_child(bullet_instance)
