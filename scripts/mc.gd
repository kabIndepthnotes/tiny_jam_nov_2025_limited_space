# mc.gd
extends CharacterBody2D
# export_vars
@export var speed = 300.0

# vars
# tile_vectors
var tile_size = 8 * 4 # 8 pixels scaled by 4

var inputs = {"move_right": Vector2.RIGHT,
			"move_left": Vector2.LEFT,
			"move_up": Vector2.UP,
			"move_down": Vector2.DOWN}
var screen_size
var facing_direction = Vector2.DOWN # Track current facing direction

# builtin_functions
func _ready():
	# _ready
	position = position.snapped(Vector2.ONE * tile_size)
	position.x += tile_size / 2
	screen_size = get_viewport_rect().size
	print(position.x)
	update_direction_arrow() # Initialize arrow direction


func _unhandled_input(event):
	# _unhandled_input
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

	
# func _physics_process(delta: float) -> void:
	# @{_physics_process}

# custom_functions
func move(dir):
	# move
	var movement = inputs[dir] * tile_size
	var collision = move_and_collide(movement, true)
	if collision == null:
		position += movement
		position = position.clamp(Vector2.ZERO, screen_size)
		# Update facing direction when movement succeeds
		facing_direction = inputs[dir]
		update_direction_arrow()


func update_direction_arrow():
	# Shows the correct directional arrow and hides the others
	# Hide all arrows first
	if has_node("DirectionArrowUp"):
		get_node("DirectionArrowUp").visible = false
	if has_node("DirectionArrowDown"):
		get_node("DirectionArrowDown").visible = false
	if has_node("DirectionArrowLeft"):
		get_node("DirectionArrowLeft").visible = false
	if has_node("DirectionArrowRight"):
		get_node("DirectionArrowRight").visible = false
	
	# Show only the correct arrow based on facing direction
	if facing_direction == Vector2.UP and has_node("DirectionArrowUp"):
		get_node("DirectionArrowUp").visible = true
	elif facing_direction == Vector2.DOWN and has_node("DirectionArrowDown"):
		get_node("DirectionArrowDown").visible = true
	elif facing_direction == Vector2.LEFT and has_node("DirectionArrowLeft"):
		get_node("DirectionArrowLeft").visible = true
	elif facing_direction == Vector2.RIGHT and has_node("DirectionArrowRight"):
		get_node("DirectionArrowRight").visible = true
