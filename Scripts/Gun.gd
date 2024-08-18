extends Sprite2D

var can_fire = true

@onready var Magic_orb = preload("res://Characters/bullet.tscn")

var rotation_speed = 100.0
		


func _process(delta):
	var mouse_position = get_global_mouse_position()
	var direction = (mouse_position - global_position).normalized()
	var target_angle = direction.angle()
	
	
	# Interpolate the rotation smoothly
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
	
	if Input.is_action_pressed("Shoot"):
		if can_fire:
			var bullet_instance = Magic_orb.instantiate()
			bullet_instance.rotation = rotation
			bullet_instance.global_position = $Marker2D.global_position
			get_parent().add_child(bullet_instance)
			can_fire= false
			$BulletCooldownTimer.start(0.5)


func _on_bullet_cooldown_timer_timeout():
	
	can_fire = true


	
