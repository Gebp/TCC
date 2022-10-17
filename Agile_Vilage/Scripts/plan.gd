extends Node

onready var card = preload("res://Objetos/TaskCard.tscn")
var tasks = []
var task_cards = GlobalVar.task

func _ready():
	if GlobalVar.sprint == 0:
		$Encerrar.visible = false
		$Encerrar.disabled = true
	else:
		$Encerrar.visible = true
		$Encerrar.disabled = false
	var v = 0
	for task in task_cards:
		var item = card.instance()
		item.get_children()[-1].text = task_cards[v]
		item.position.x = GlobalVar.pos[v][0]
		item.position.y = GlobalVar.pos[v][1]
		add_child(item)
		add_task(item)
		v += 1
	if GlobalVar.tutorial and GlobalVar.sprint == 0:
		$Cabecalho/T_plan.stop()
		$Tutorial/Popup0.popup_centered()

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

# Passagem dos tutoriais
# -----------------------
func _on_Popup0_popup_hide():
	$Tutorial/Popup1.popup()

func _on_Popup1_popup_hide():
	$Tutorial/Popup2.popup()

func _on_Popup2_popup_hide():
	$Tutorial/Popup3.popup()

func _on_Popup3_popup_hide():
	$Encerrar.visible = true
	$Tutorial/Popup4.popup()

func _on_Popup4_popup_hide():
	$Encerrar.visible = false
	$Tutorial/Popup5.popup()

func _on_Popup5_popup_hide():
	$Cabecalho/T_plan.start()
# -----------------------

func _on_Executar_pressed():
	get_tree().change_scene("res://Telas/4-Execucao.tscn")

func _on_Executar_mouse_entered():
	$Executar.modulate = 'd2d2d2'

func _on_Executar_mouse_exited():
	$Executar.modulate = 'ffffff'

func _on_Encerrar_pressed():
	GlobalVar.sprint -= 1
	get_tree().change_scene("res://Telas/5-Resultado.tscn")
