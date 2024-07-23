extends CharacterBody2D

@export var speed = 50
var player_chase = false
var player = null
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


		
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if player_chase:
		position.x += (player.position.x - position.x) / speed
		
		
		
func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Main_Character":
		player = body
		player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "Main_Character":
		player = null
		player_chase = false
