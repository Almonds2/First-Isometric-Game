extends CharacterBody2D

@onready var sprite_VAR := $AnimatedSprite2D

@export var speed_VAR = 20

@onready var animated_sprite_VAR = $AnimatedSprite2D
var last_direction_VAR := "front"
var is_idle_VAR := true

@export var inv_var: Inv

func _ready() -> void:
	animated_sprite_VAR.play("idle_front_anim")
	
func _physics_process(_delta: float) -> void:
	
	var direction_VAR = Input.get_vector("left", "right", "up", "down")
	
	if direction_VAR != Vector2.ZERO:
		velocity = direction_VAR * speed_VAR
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _process(_delta: float) -> void:
	
	if Input.is_action_pressed("right") and !Input.is_action_pressed("up") and !Input.is_action_pressed("left"):
		play_walking_func("right")
	elif Input.is_action_pressed("left") and !Input.is_action_pressed("up") and !Input.is_action_pressed("right"):
		play_walking_func("left")
	elif Input.is_action_pressed("down"):
		play_walking_func("front")
	elif Input.is_action_pressed("up"):
		play_walking_func("behind")
	else:
		if is_idle_VAR == false:
			play_idle_func()
			is_idle_VAR = true
		
func play_walking_func(direction_VAR):
	if direction_VAR != "left":
		animated_sprite_VAR.play("walk_" + direction_VAR + "_anim")
		last_direction_VAR = direction_VAR
		sprite_VAR.flip_h = false
	else:
		animated_sprite_VAR.play("walk_right_anim")
		last_direction_VAR = "right"
		sprite_VAR.flip_h = true
		
	is_idle_VAR = false
		
func play_idle_func():
			animated_sprite_VAR.play("idle_" + last_direction_VAR + "_anim")
				
		
