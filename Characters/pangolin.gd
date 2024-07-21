extends Node2D


@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D
#Will be speed in px per second.
@export var speed = 750

func _process(delta: float)->void:
	path_follow.progress+= speed * delta
