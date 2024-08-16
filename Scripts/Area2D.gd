extends Area2D
class_name pangolin


var health = 80
var health_max = 80
var health_min = 0

func _on_body_entered(body: Node2D) -> void:
	if body.name =="Main_Character":
		body.respawn()
		
		
	
	
		
		


func _on_area_entered(area):
	if area is bullet:
		queue_free()
	
