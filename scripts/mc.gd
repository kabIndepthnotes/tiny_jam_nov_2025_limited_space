# mc.gd
extends CharacterBody2D
# export_vars
@export var speed = 300.0

# vars
# tile_vectors
var tile_size = 8 # 8 pixels scaled by 4

var inputs = {"move_right": Vector2.RIGHT,
			"move_left": Vector2.LEFT,
			"move_up": Vector2.UP,
			"move_down": Vector2.DOWN}

# builtin_functions
func _ready():
	# _ready
	position = position.snapped(Vector2.ONE * tile_size)
	position.x += tile_size/2


func _unhandled_input(event):
	# _unhandled_input
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

	
# func _physics_process(delta: float) -> void:
	# @{_physics_process}

# custom_functions
func move(dir):
	position += inputs[dir] * tile_size
