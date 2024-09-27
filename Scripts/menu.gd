extends Control

@onready var title_music: AudioStreamPlayer = $TitleMusic

	

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scences/level_1.tscn")
	AudioStreamManager.play("res://Audios/Click.mp3")


func _on_quit_pressed():
	get_tree().quit()
	AudioStreamManager.play("res://Audios/Click.mp3")




func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scences/Controls.tscn")
	AudioStreamManager.play("res://Audios/Click.mp3")
