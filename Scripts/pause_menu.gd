extends Control

var is_paused: bool = false

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")



func _on_continue_pressed() -> void:
	resume()
	AudioStreamManager.play("res://Audios/Click.mp3")


func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
	AudioStreamManager.play("res://Audios/Click.mp3")


func _on_main_page_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scences/menu.tscn")
	AudioStreamManager.play("res://Audios/Click.mp3")
	
	
func _process(delta):
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
