extends Node

var items: Dictionary = {
	"phone": false
}

func has_item(item_name: String) -> bool:
	return items.get(item_name, false)

func pick_up(item_name: String) -> void:
	items[item_name] = true

func remove_item(item_name: String) -> void:
	if items.has(item_name):
		items[item_name] = false
