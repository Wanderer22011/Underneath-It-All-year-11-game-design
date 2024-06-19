extends Area2D
 
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




#func _on_body_entered(_body):
	#queue_free()
