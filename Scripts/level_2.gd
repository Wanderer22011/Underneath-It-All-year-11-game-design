extends Node2D




func _on_main_menu_pressed() -> void:
	AudioStreamManager.play("res://Audios/Click.mp3")
	get_tree().change_scene_to_file("res://scences/menu.tscn")




func _on_quit_pressed() -> void:
	AudioStreamManager.play("res://Audios/Click.mp3")
	get_tree().quit()
