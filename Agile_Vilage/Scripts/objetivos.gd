extends Node

# Reesrever esse texto
var texto_padrao = "[center]Você foi apontado como novo responsável pelo Vilarejo X. \n\nNo entanto, para que mantenha sua nova posição, você deverá, primeiramente, provar ser capaz de realizar um bom gerenciamento do vilarejo. \n\nUtilizando de práticas ágeis, faça um planejamento e o execute, desenvolvendo cada vez mais suas terras.\n\n"

onready var lista = get_node("ListaObj")
# Lista de opções
var items = ['Crescimento Populacional', 'Combate ao Crime', 'Defesa contra Invasores', 'Distribuição de Alimentos']

# Chamada quando inicia a função.
func _ready():
	add_items()
	disable_items(0)
	$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Selecione um dos objetivos para iniciar"
	$Iniciar_proj.disabled = true
	$Iniciar_proj/BotaoProx.visible = false

func add_items():
	lista.add_item('- Selecione um Objetivo -') # Posição 0
	lista.add_separator() # Posição 1
	for i in items:
		lista.add_item(i)

func disable_items(id):
	lista.set_item_disabled(id, true)

func _on_ListaObj_item_selected(index):
	var i = index - 2
	GlobalVar.obj = i
	$Iniciar_proj.disabled = false
	$Iniciar_proj/BotaoProx.visible = true
	
	if i == 0:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Durante esse período de teste, informo-lhe que nos últimos tempos o vilarejo tem sofrido com o crescimento populacional, novas pessoas tem vindo para fugir dos conflitos de suas terras.\n\nMas o vilarejo não possui estrutura para manter tantas pessoas. Por conta disso, muitos se encontram sem uma moradia.\n\nConstrua casas para que essas pessoas tenham onde viver."
		$TextObj.text = str('Quantidade inicial de energia/ Ações por rodada: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n3 casas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 10 Madeiras + 4 Vidros + 5 Pedras + 5 Energias')
		GlobalVar.obj_casas = 3
		GlobalVar.task = ['Task 1', 'Task 2', 'Task 3', 'Task 4']
	if i == 1:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 2"
		$TextObj.text = str('Quantidade inicial de energia/ Ações por rodada: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\nX casas\nX torres\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 10 Madeiras + 4 Vidros + 5 Pedras + 5 Energias\n1 Torre = x')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false
	if i == 2:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 3"
		$TextObj.text = str('Quantidade inicial de energia/ Ações por rodada: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\nX casas\nX torres\n x muros\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 10 Madeiras + 4 Vidros + 5 Pedras + 5 Energias\n1 Torre = x\n1 Muro = x')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false
	if i == 3:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 4"
		$TextObj.text = str('Quantidade inicial de energia/ Ações por rodada: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\nX casas\nX torres\n x muros\nx fazendas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 10 Madeiras + 4 Vidros + 5 Pedras + 5 Energias\n1 Torre = x\n1 Muro = x\n1 Fazenda = x')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false

func _on_QtdSprint_value_changed(value):
	GlobalVar.qtd_sprint = value
	print(GlobalVar.qtd_sprint)

func _on_Iniciar_proj_pressed():
	get_tree().change_scene("res://Telas/3-Planejamento.tscn")

func _on_Iniciar_proj_mouse_entered():
	$Iniciar_proj.modulate = 'd2d2d2'

func _on_Iniciar_proj_mouse_exited():
	$Iniciar_proj.modulate = 'ffffff'
