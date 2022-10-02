extends Node

onready var card = preload("res://Objetos/TaskCard.tscn")
var tasks = []
var task_cards = GlobalVar.task

func _ready():
	var v = 0
	for task in task_cards:
		var item = card.instance()
		item.get_children()[-1].text = task_cards[v]
		add_child(item)
		add_task(item)
		v += 1

func add_task(item):
	tasks.append(item)
	
	var cont = 0
	for i in tasks:
		i.z_index = cont
		cont += 1

func trazer_para_frente(item):
	print(tasks)
	tasks.erase(item)
	add_child(item)
	print(tasks)

func _on_Executar_pressed():
	get_tree().change_scene("res://Telas/4-Execucao.tscn")

func _on_Executar_mouse_entered():
	$Executar.modulate = 'd2d2d2'

func _on_Executar_mouse_exited():
	$Executar.modulate = 'ffffff'
