extends Node2D

@onready var enemy = preload("res://Characters/enermy_from_spawner.tscn")



func _on_timer_timeout():
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
