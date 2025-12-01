# mc.gd
extends CharacterBody2D
# export_vars
@export var speed = 300.0

# onready_vars
@onready var all_interactions = []
@onready var interactLabel = $InteractionComponent/InteractLabel

# vars
var tile_size = 8 * 4 # 8 pixels scaled by 4
var player_size = Vector2(14 * 4, 20 * 4)
var inputs = {"move_right": Vector2.RIGHT,
			"move_left": Vector2.LEFT,
			"move_up": Vector2.UP,
			"move_down": Vector2.DOWN,
}
var facing_direction = Vector2.DOWN # Track current facing direction

# builtin_functions
func _ready():
	# _ready
	position = position.snapped(Vector2.ONE * tile_size)
	position.x += tile_size / 2
	print(position.x)
	var interact_area = $InteractionComponent/InteractionArea
	interact_area.area_entered.connect(_on_interact_area_entered)
	interact_area.area_exited.connect(_on_interact_area_exited)
	update_interactions()


func _unhandled_input(event):
	# _unhandled_input
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	if event.is_action_pressed("interact"):
		execute_interactions()

	
# func _physics_process(delta: float) -> void:
# 	@{_physics_process}

# custom_functions
# f_move
func move(dir):
	var movement = inputs[dir] * tile_size
	var collision = move_and_collide(movement, true)
	if collision == null:
		position += movement

func _on_interact_area_entered(area):
	all_interactions.insert(0,area)
	print("entered") # debug
	update_interactions()

func _on_interact_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions: # if all_interactions is non-empty
		interactLabel.text = all_interactions[0].interact_label # from interact_area scene
	else:
		interactLabel.text = ""
func execute_interactions():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"print_text": print(cur_interaction.interact_value)
