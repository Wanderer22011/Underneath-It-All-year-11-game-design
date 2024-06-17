extends Area2D

var speed = 400
var velocity = Vector2()

func _ready():
	$CollisionShape2D.disabled = false

func _process(delta):
	position+=velocity*delta
	if !is_instance_valid(self):
		queue_free()
