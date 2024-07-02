extends Area2D

func _on_exit_body_entered(body: Node2D)-> void:
	if body.name == "main_character":
		get_tree().change_scene_to_file("res://scences/level_2.tscn")
