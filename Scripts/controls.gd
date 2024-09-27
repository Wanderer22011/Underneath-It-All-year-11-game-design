extends Control



func _on_start_game_pressed() -> void:
	AudioStreamManager.play("res://Audios/Click.mp3")
	get_tree().change_scene_to_file("res://scences/level_1.tscn")




func _on_back_pressed() -> void:
	AudioStreamManager.play("res://Audios/Click.mp3")
	get_tree().change_scene_to_file("res://scences/menu.tscn")
