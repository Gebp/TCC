extends Node

# Reesrever esse texto
var texto_padrao = "[center]Você foi apontado como novo responsável pelo Vilarejo X. \n\nPara provar seu valor e manter sua nova posição, você deverá utilizar as práticas ágeis para que o vilarejo creça e se desenvolva.\n\n"

onready var lista = get_node("ListaObj")
# Lista de opções
var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4']

# Chamada quando inicia a função.
func _ready():
	add_items()
	disable_items(0)
	$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Para mais detalhes, selecione um dos objetivos"
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
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Sabe-se que o povo tem sofrido com a falta de moradias por conta do recente crescimento populacional.\n\nPlaneje e gerencie a construção dessas novas casas."
		$TextObj.text = str('Construa:\n\n5 casas')
		GlobalVar.obj_casas = 5
	if i == 1:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 2"
		$TextObj.text = str('Objetivo 2')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false
	if i == 2:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 3"
		$TextObj.text = str('Objetivo 3')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false
	if i == 3:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 4"
		$TextObj.text = str('Objetivo 4')
		$Iniciar_proj.disabled = true
		$Iniciar_proj/BotaoProx.visible = false

func _on_QtdSprint_value_changed(value):
	GlobalVar.qtd_sprint = value
	print(GlobalVar.qtd_sprint)

func _on_Iniciar_proj_pressed():
	get_tree().change_scene("res://Telas/3-Planejamento.tscn")
