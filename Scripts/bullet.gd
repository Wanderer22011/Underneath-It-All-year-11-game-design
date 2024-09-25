extends Area2D
class_name bullet
@onready var explosion_prefab = preload("res://Characters/explosion.tscn")
 
var speed = 1000

func _ready():
	set_as_top_level(true)
	
func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation)* delta
	
func _physics_process(_delta):
	get_tree().create_timer(1)
	set_physics_process(false)
	



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()






#func _on_area_entered(area):
	#if area:
		#var explosion=explosion_prefab.instantiate()
		#explosion.global_position = global_position
		#explosion.get_child(0).emitting = true
		#get_parent().add_child(explosion)
		#queue_free()
		#AudioStreamManager.play("res://Audios/Boom_Sound.mp3")

func _on_body_entered(body):
	if body:
		var explosion=explosion_prefab.instantiate()
		explosion.global_position = self.global_position
		explosion.get_child(0).emitting = true
		get_parent().get_parent().add_child(explosion)
		queue_free()
		AudioStreamManager.play("res://Audios/Boom_Sound.mp3")
		
