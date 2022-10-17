extends Node

# Reesrever esse texto
var texto_padrao = "[center]Você foi apontado como novo responsável pelo Vilarejo X. \n\nNo entanto, para que mantenha sua nova posição, você deverá, primeiramente, provar ser capaz de realizar um bom gerenciamento do vilarejo. \n\nUtilizando de práticas ágeis, faça um planejamento e o execute, desenvolvendo cada vez mais suas terras.\n\n"

onready var lista = get_node("ListaObj")
# Lista de opções
var items = ['Crescimento Populacional', 'Casamento', 'Defesa contra Invasores', 'Novo Fazendeiro']

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
		# A vila tem progredido bem e muitos cidadões estão tem se mudando para ca como responsável da vila voce perceu beu que precisava criar maias casas.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n3 casas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 8 Madeiras + 4 Vidros + 5 Pedras + 5 Energias\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias')
		GlobalVar.obj_casas = 3
		GlobalVar.task = ['Task 1', 'Task 2', 'Task 3', 'Task 4']
		GlobalVar.pos = [[35, 495], [35, 495], [35, 495], [35, 495]]
	if i == 1:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Entretanto, durante esse período de teste, uma das famílias mais antigas e renomadas do vilarejo irá casar sua filha e pretende tornar o casamento um grande evento, além de presentear o casal com uma casa.\n\nA família do rapaz é de outra região e todos pretendem se mudar para este vilarejo logo após o casamento\n\nPara receber suporte dessas duas famílias muito influentes, construa a casa que será o presente para os noivos e uma casa para a nova família que está vindo, ambas protegidas por muros."
		# Aconteu um casamento na vila e os pais da noiva querem fazer uma surpresa presenteando os casal com uma casa nova.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n2 casas\n4 muros\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias\n1 Muro = 4 Pedras + 2 Madeiras + 2 Energias\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias')
		GlobalVar.obj_casas = 2
		GlobalVar.obj_muros = 4
		GlobalVar.task = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5', 'Task 6']
		GlobalVar.pos = [[35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495]]
	if i == 2:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Pouco tempo antes de você ser chamado e seu período de testes inciair, recebemos diversos pedidos de ajuda e reclamações da vilarejo, por conta do aumento na quantidade de invasões e saqueamentos no vilarejo\n\nSabemos, porém, que esse não é um problema exclusivo do vilarejo, mas sim um problema generalizado que tem afetado todo o reino e por conta disso, tem sido enviado para cada vilarejo um general, junto de sua família, que será responsável por gerir a segurança do local\n\nPara auxiliar esse general construa uma moradia, visto que ele ficará por tempo indeterminado, e algumas torres e muros, para que a população se sinta mais segura."
		# A cidade vila tem crescido e properado, mas isso atraiu novos invasores por isso se tornou necessário aumentar a defesa.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n1 casa\n6 muros\n2 torres\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias\n1 Muro = 4 Pedras + 2 Madeiras + 2 Energias\n1 Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias')
		GlobalVar.obj_casas = 1
		GlobalVar.obj_muros = 6
		GlobalVar.obj_torres = 2
		GlobalVar.task = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5', 'Task 6', 'Task 7', 'Task 8']
		GlobalVar.pos = [[35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495]]
	if i == 3:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Como você sabe, o vilarejo ainda é relativamente pequeno, mas a região a sua volta possui muitos recursos a serem explorados e o solo é extremamente fértil.\n\nSabendo disso, um grande fazendeiro pretende se mudar para essas terras, para fugir do solo sem vida onde se encontra atualmente, em busca de recuperar as riquezas e o reconhecimento que possuia .Para isso, irá trazer consigo sua família e seus trabalhadores\n\nEsse fazendeiro prega muito pela segurança de seus familiares e de seus subordinados, portanto ele gostaria que alguns guardas fixos para que cuidem de suas propriedades\n\nPara ajudar esse novos fazendeiro a se estabelecer e se sentir seguro construa casas para ele e seus subordinados, vários muros e torres para que as propriedades estejam seguras e algumas fazendas, para que ele possa gerir"
		# Um grande fazendeiro se mudou para a vila, e quer trazer sua familia e trabalhadores junto e vai precisar de onde se estabelecer.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n3 casas\n10 muros\n3 torres\n2 fazendas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias\n1 Muro = 4 Pedras + 2 Madeiras + 2 Energias\n1 Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias\n1 Fazenda = 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias')
		GlobalVar.obj_casas = 3
		GlobalVar.obj_muros = 10
		GlobalVar.obj_torres = 3
		GlobalVar.obj_fazendas = 2
		GlobalVar.task = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5', 'Task 6', 'Task 7', 'Task 8', 'Task 9', 'Task 10']
		GlobalVar.pos = [[35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495], [35, 495]]

func _on_QtdSprint_value_changed(value):
	GlobalVar.qtd_sprint = value

func _on_Iniciar_proj_pressed():
	get_tree().change_scene("res://Telas/3-Planejamento.tscn")

func _on_Iniciar_proj_mouse_entered():
	$Iniciar_proj.modulate = 'd2d2d2'

func _on_Iniciar_proj_mouse_exited():
	$Iniciar_proj.modulate = 'ffffff'
