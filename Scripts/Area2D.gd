extends Area2D
class_name pangolin



func _on_body_entered(body: Node2D) -> void:
	if body.name =="Main_Character":
		body.respawn()



func _on_area_entered(area):
	if area is bullet:
		queue_free()
