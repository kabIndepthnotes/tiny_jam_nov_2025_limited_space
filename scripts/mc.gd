# mc.gd
extends CharacterBody2D
# export_vars
@export var speed = 300.0

# vars
var tile_size = 8 * 4 # 8 pixels scaled by 4
var player_size = Vector2(14 * 4, 20 * 4)
var inputs = {"move_right": [Vector2.RIGHT, Vector2(player_size.x / 2, player_size.y / 2)],
			"move_left": [Vector2.LEFT, Vector2(-player_size.x / 2, player_size.y / 2)],
			"move_up": [Vector2.UP, Vector2(player_size.x / 2, 0)],
			"move_down": [Vector2.DOWN, Vector2(player_size.x / 2 , player_size.y)],
}
var facing_direction = Vector2.DOWN # Track current facing direction

# builtin_functions
func _ready():
	# _ready
	position = position.snapped(Vector2.ONE * tile_size)
	position.x += tile_size / 2
	print(position.x)


func _unhandled_input(event):
	# _unhandled_input
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

	
# func _physics_process(delta: float) -> void:
	# @{_physics_process}

# custom_functions
# f_move
func move(dir):
	var movement = inputs[dir][0] * tile_size
	$Area2D.position = inputs[dir][1]
	var collision = move_and_collide(movement, true)
	if collision == null:
		position += movement
