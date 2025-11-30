extends Control
var answer := 0
var tries := 3
var correct_answer = 11
@onready var answer_label: Label = $CanvasLayer/Panel/answer
@onready var tries_label: Label = $CanvasLayer/Panel/attempts_remaining
@onready var panel = $CanvasLayer/Panel


func update_label():
	answer_label.text = str(answer)
	tries_label.text = str(tries)
func _on_up_arrow_pressed() -> void:
	answer +=1
	update_label()

func _on_down_arrow_pressed() -> void:
	answer -=1
	update_label()

func _on_submit_pressed() -> void:
	if tries <=0:
		return
	if answer == correct_answer:
		Inventory.pick_up("computer_password")
	else:
		tries-=1
	update_label()


func _on_button_pressed() -> void:
	panel.visible = true


func _on_close_button_pressed() -> void:
	panel.visible = false
