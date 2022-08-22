extends Control

onready var lista = get_node('../ListaObj')
# Lista de opções
var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4']

# Chamada quando inicia a função.
func _ready():
	add_items()
	disable_items(0)

func add_items():
	lista.add_item('- Selecione um Objetivo -') # Posição 0
	lista.add_separator() # Posição 1
	for i in items:
		lista.add_item(i)

func disable_items(id):
	lista.set_item_disabled(id, true)

func _on_ListaObj_item_selected(index):
	var i = index - 2
	
	if i == 0:
		print('0')
	if i == 1:
		print('1')
	if i == 2:
		print('2')
	if i == 3:
		print('3')
