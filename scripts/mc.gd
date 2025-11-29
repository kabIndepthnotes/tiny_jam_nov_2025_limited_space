# mc.gd
extends CharacterBody2D
# export_vars
@export var speed = 300.0

# vars

# builtin_functions
func _physics_process(delta: float) -> void:
	# _physics_process
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		print("moving_right!")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	position += velocity * speed * delta
	# move_and_slide()


# custom_functions
