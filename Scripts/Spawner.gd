extends Node2D
@onready var explosion_prefab = preload("res://Characters/explosion.tscn")
@onready var enemy = preload("res://Characters/enermy_from_spawner.tscn")



func _on_timer_timeout():
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)



func _on_area_entered(area):
	if area is bullet:
		var explosion=explosion_prefab.instantiate()
		explosion.global_position = global_position
		explosion.get_child(0).emitting = true
		get_parent().add_child(explosion)
		queue_free()
