extends CharacterBody2D

const speed = 60
var dir: Vector2
var is_enemy_chase: bool
var player = CharacterBody2D
var health = 50
var health_max = 50
var health_min = 0

func _ready():
	is_enemy_chase = true
	
func _process(delta):
	move(delta)
	handle_animation()

func move(delta):
	if is_enemy_chase:
		player = Global.playerBody
		velocity = position.direction_to(player.position) * speed
		dir.x = abs(velocity.x) / velocity.x

	move_and_slide()
	
func _on_enemy_movement_timer_timeout():
	$"Enemy movement timer".wait_time = choose([0.5, 0.8, 1.0])
	if !is_enemy_chase:
		dir = choose([Vector2. RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])


func handle_animation():
	var animaated_sprite = $AnimatedSprite2D
	animaated_sprite.play("Run")
	if dir.x == -1:
		animaated_sprite.flip_h = true
		
	if dir.x == 1:
		animaated_sprite.flip_h = false
	
	
	
func choose(array):
	array.shuffle()
	return array.front()




func _on_area_2d_body_entered(body:Node2D)-> void:
	if body.name =="Main_Character":
		body.respawn()


func _on_area_2d_area_entered(area):
	if area is bullet:
		queue_free()
