extends Area2D
signal clicked

var in_range := false

func _on_clicked() -> void:
	if not in_range:
		return
	Inventory.pick_up("phone")


func _on_body_entered(body: Node2D) -> void:
	in_range = true


func _on_body_exited(body: Node2D) -> void:
	in_range = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_just_pressed("interact"):
		clicked.emit()
