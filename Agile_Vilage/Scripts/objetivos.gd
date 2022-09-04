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

	if i == 0:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 1"
		$TextObj.text = str('Objetivo 1')
	if i == 1:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 2"
		$TextObj.text = str('Objetivo 2')
	if i == 2:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 3"
		$TextObj.text = str('Objetivo 3')
	if i == 3:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "[color=red]Objetivo 4"
		$TextObj.text = str('Objetivo 4')

func _on_QtdSprint_value_changed(value):
	GlobalVar.qtd_sprint = value
	print(GlobalVar.qtd_sprint)
