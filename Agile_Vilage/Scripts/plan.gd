extends Node

onready var cena_arastavel: PackedScene = preload("res://Objetos/TaskCard.tscn")
onready var container_a = $Container_cards

var task_cards = [
	{'id': 1, 'texto': 'Task 1'},
	{'id': 2, 'texto': 'Task 2'},
	{'id': 3, 'texto': 'Task 3'},
	{'id': 4, 'texto': 'Task 4'},
]

func _ready():
	_popular_cards()

func _popular_cards():
	for task in task_cards:
		var item = cena_arastavel.instance()
		item.id = task['id']
		item.texto = task['texto']
		container_a.add_child(item)

func _on_item_dropped_on_target(dropped_item: Arrastavel):
	for item in container_a.get_children():
		item = (item as Arrastavel)
		if item.id == dropped_item.id:
			container_a.remove_child(item)
			item.queue_free()
			break
