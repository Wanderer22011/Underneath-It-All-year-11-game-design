extends CharacterBody2D


const SPEED = 300.0

const JUMP_VELOCITY = -400.
var jump_Buffer: bool = false
var jump_Available: bool = true
@export var jump_Buffer_time: float = 0.3
var jump_time = 0
var jump_duration=0.3
var starting_position= Vector2(-147, 274)

@onready var walking_sound: AudioStreamPlayer = $WalkingSound
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	Global.playerBody = self

enum State{Idle, Run, Jump, Shoot }

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		jump_Available=false
		
	
	else:
		jump_Available=true
		if jump_Buffer:
			Jump()
			anim.play("Jump")
			AudioStreamManager.play("res://Audios/JumpSound.mp3")
			jump_Buffer=false
			
		if abs(velocity.x) > 10:
			anim.play("Walking")
			
		else:
			anim.play("Idle")

	if velocity.x <0:
		anim.flip_h = true
	else:
		anim.flip_h = false
	# Handle jump.
	if Input.is_action_just_pressed("Jump"):
		if jump_Available:
			
			if jump_time < jump_duration:
				Jump()
				jump_time += delta
				AudioStreamManager.play("res://Audios/JumpSound.mp3")
				anim.play("Jump")
			else:
				jump_time=0
			
		else:
			jump_Buffer=true
			get_tree().create_timer(jump_Buffer_time).timeout.connect(on_jump_buffer_timeout)
	if Input.is_action_just_pressed("Left"):
		walking_sound.play()
	elif Input.is_action_just_pressed("Right"):
		walking_sound.play()
	
	elif Input.is_action_just_released("Left"):
		walking_sound.stop()
	
	elif  Input.is_action_just_released("Right"):
		walking_sound.stop()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
		


	move_and_slide()


func Jump()-> void:
	velocity.y = JUMP_VELOCITY

func on_jump_buffer_timeout()->void:
	jump_Buffer= false
	
func respawn():
	position=starting_position
