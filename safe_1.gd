extends Control
@export var answer := 0
@export var tries := 3
@export var correct_answer = 11
@export var text : String = "2, 3, 5, 7,"
@onready var answer_label: Label = $CanvasLayer/Panel/answer
@onready var tries_label: Label = $CanvasLayer/Panel/attempts_remaining
@onready var panel = $CanvasLayer/Panel
@onready var puzzle_label : Label = $CanvasLayer/Panel/Label

func update_label():
	answer_label.text = str(answer)
	tries_label.text = str(tries)
	puzzle_label.text = text
func _on_up_arrow_pressed() -> void:
	answer +=1
	update_label()

func _on_down_arrow_pressed() -> void:
	answer -=1
	update_label()

func _on_submit_pressed() -> void:
	if tries <=0:
		get_tree().change_scene_to_file("res://scenes/lose.tscn")
	if answer == correct_answer:
		Inventory.pick_up("computer_password")
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	else:
		tries-=1
		$wrong.play()
	update_label()


func _on_button_pressed() -> void:
	panel.visible = true


func _on_close_button_pressed() -> void:
	panel.visible = false
