extends Control

@onready var title_music: AudioStreamPlayer = $TitleMusic

	

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scences/level_1.tscn")


func _on_quit_pressed():
	get_tree().quit()




func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/Controls.tscn")
