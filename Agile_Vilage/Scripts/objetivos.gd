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
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\nDias por Sprint: 4\nNível de conhecimento inicial: 1\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n3 casas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Casa = 8 Madeiras + 4 Vidros + 5 Pedras + 5 Energias + Conhecimento nível 2\n\n1 Nível de Conhecimento = 3 Moedas * nível de conhecimento atual + 2 Energias * nível de conhecimento atual\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias\n1 Moeda = 1 Mineral + 2 Carvões')
		GlobalVar.obj_casas = 3
		GlobalVar.task = ['Atinja o nível de conhecimento 2', 'Faça 3 moedas para adquirir conhecimento', 'Colete 24 madeiras para as casas', 'Colete 15 pedras para as casas', 'Faça 12 vidros para as casas', 'Melhore o limite de recursos 4 vezes', 'Faça 12 moedas para aumentar o limite de recursos']
		for t in GlobalVar.task:
			GlobalVar.pos.append([35, 495])
	if i == 1:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Entretanto, durante esse período de teste, uma das famílias mais antigas e renomadas do vilarejo irá casar sua filha e pretende tornar o casamento um grande evento, além de presentear o casal com uma casa.\n\nA família do rapaz é de outra região e todos pretendem se mudar para este vilarejo logo após o casamento\n\nPara receber suporte dessas duas famílias muito influentes, construa a casa que será o presente para os noivos e uma casa para a nova família que está vindo, ambas protegidas por muros."
		# Aconteu um casamento na vila e os pais da noiva querem fazer uma surpresa presenteando os casal com uma casa nova.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\nDias por Sprint: 4\nNível de conhecimento inicial: 1\n\n--------------------------------------------------------------------------------------------\n\nConstruções:\n\n4 muros\n2 casas\n\n--------------------------------------------------------------------------------------------\n\nCustos:\n\n1 1 Muro = 4 Pedras + 2 Madeiras + 2 Energias + Conhecimento nível 1\nCasa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias + Conhecimento nível 2\n\n1 Nível de Conhecimento = 3 Moedas * nível de conhecimento atual + 2 Energias * nível de conhecimento atual\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias\n1 Moeda = 1 Mineral + 2 Carvões')
		GlobalVar.obj_casas = 2
		GlobalVar.obj_muros = 4
		GlobalVar.task = ['Atinja o nível de conhecimento 2', 'Faça 3 moedas para adquirir conhecimento', 'Colete 16 madeiras para as casas', 'Colete 10 pedras para as casas', 'Faça 8 vidros para as casas', 'Colete 8 pedras para os muros 1 e 2', 'Colete 4 madeiras para os muros 1 e 2', 'Colete 8 pedras para os muros 3 e 4', 'Colete 4 madeiras para os muros 3 e 4']
		for t in GlobalVar.task:
			GlobalVar.pos.append([35, 495])
	if i == 2:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Pouco tempo antes de você ser chamado e seu período de testes inciair, recebemos diversos pedidos de ajuda e reclamações da vilarejo, por conta do aumento na quantidade de invasões e saqueamentos no vilarejo\n\nSabemos, porém, que esse não é um problema exclusivo do vilarejo, mas sim um problema generalizado que tem afetado todo o reino e por conta disso, tem sido enviado para cada vilarejo um general, junto de sua família, que será responsável por gerir a segurança do local\n\nPara auxiliar esse general construa uma moradia, visto que ele ficará por tempo indeterminado, e algumas torres e muros, para que a população se sinta mais segura."
		# A cidade vila tem crescido e properado, mas isso atraiu novos invasores por isso se tornou necessário aumentar a defesa.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\nDias por Sprint: 4\nNível de conhecimento inicial: 1\n\n-------------------------------------------------------------------------------------------\n\nConstruções:\n\n6 muros\n1 casa\n2 torres\n\n-------------------------------------------------------------------------------------------\n\nCustos:\n\n1 1 Muro = 4 Pedras + 2 Madeiras + 2 Energias + Conhecimento nível 1\nCasa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias + Conhecimento nível 2\n1 Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias + Conhecimento nível 3\n\n1 Nível de Conhecimento = 3 Moedas * nível de conhecimento atual + 2 Energias * nível de conhecimento atual\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias\n1 Moeda = 1 Mineral + 2 Carvões')
		GlobalVar.obj_casas = 1
		GlobalVar.obj_muros = 6
		GlobalVar.obj_torres = 2
		GlobalVar.task = ['Atinja o nível de conhecimento 3', 'Faça 9 moedas para adquirir conhecimento', 'Colete 8 madeiras para a casa', 'Colete 5 pedras para as casa', 'Faça 4 vidros para a casa', 'Colete 12 pedras para os muros 1, 2 e 3', 'Colete 6 madeiras para os muros 1, 2 e 3', 'Colete 12 pedras para os muros 4, 5 e 6', 'Colete 6 madeiras para os muros 4, 5 e 6', 'Colete 24 pedras para para as torres', 'Colete 12 madeiras para para as torres', 'Faça 10 vidros para as torres', 'Melhore o limite de recursos 4 vezes', 'Faça 12 moedas para aumentar o limite de recursos']
		for t in GlobalVar.task:
			GlobalVar.pos.append([35, 495])
	if i == 3:
		$Mensagem_inicial/TextoIntro.bbcode_text = texto_padrao + "Como você sabe, o vilarejo ainda é relativamente pequeno, mas a região a sua volta possui muitos recursos a serem explorados e o solo é extremamente fértil.\n\nSabendo disso, um grande fazendeiro pretende se mudar para essas terras, para fugir do solo sem vida onde se encontra atualmente, em busca de recuperar as riquezas e o reconhecimento que possuia .Para isso, irá trazer consigo sua família e seus trabalhadores\n\nEsse fazendeiro prega muito pela segurança de seus familiares e de seus subordinados, portanto ele gostaria que alguns guardas fixos para que cuidem de suas propriedades\n\nPara ajudar esse novos fazendeiro a se estabelecer e se sentir seguro construa casas para ele e seus subordinados, vários muros e torres para que as propriedades estejam seguras e algumas fazendas, para que ele possa gerir"
		# Um grande fazendeiro se mudou para a vila, e quer trazer sua familia e trabalhadores junto e vai precisar de onde se estabelecer.
		$TextObj.text = str('Quantidade inicial de energia/ Ações por dia: 10\nDias por Sprint: 4\nNível de conhecimento inicial: 1\n\n-------------------------------------------------------------------------------------------\n\nConstruções:\n\n10 muros\n3 casas\n3 torres\n2 fazendas\n\n-------------------------------------------------------------------------------------------\n\nCustos:\n\n1 Muro = 4 Pedras + 2 Madeiras + 2 Energias + Conhecimento nível 1\n1 Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias + Conhecimento nível 2\n1 Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias + Conhecimento nível 3\n1 Fazenda = 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias + Conhecimento nível 4\n\n1 Nível de Conhecimento = 3 Moedas * nível de conhecimento atual + 2 Energias * nível de conhecimento atual\n\n1 Vidro = 5 Areias + 2 Carvões + 2 Energias\n1 Moeda = 1 Mineral + 2 Carvões')
		GlobalVar.obj_casas = 3
		GlobalVar.obj_muros = 10
		GlobalVar.obj_torres = 3
		GlobalVar.obj_fazendas = 2
		GlobalVar.task = ['Atinja o nível de conhecimento 4', 'Faça 18 moedas para adquirir conhecimento', 'Colete 24 madeiras para as casas', 'Colete 15 pedras para as casas', 'Faça 12 vidros para as casas', 'Colete 20 pedras para os 5 primeiros muros', 'Colete 10 madeiras para os 5 primeiros muros', 'Colete 20 pedras para os muros 5 últimos muros', 'Colete 10 madeiras para os 5 últimos muros', 'Colete 36 pedras para para as torres', 'Colete 18 madeiras para para as torres', 'Faça 15 vidros para as torres', 'Colete 8 pedras para para as fazendas', 'Colete 24 madeiras para para as fazendas', 'Faça 8 vidros para as fazendas', 'Melhore o limite de recursos 6 vezes', 'Faça 18 moedas para aumentar o limite de recursos', 'Melhore o limite de materiais 3 vezes', 'Faça 9 moedas para aumentar o limite de recursos']
		for t in GlobalVar.task:
			GlobalVar.pos.append([35, 495])

func _on_QtdSprint_value_changed(value):
	GlobalVar.qtd_sprint = value

func _on_Iniciar_proj_pressed():
	get_tree().change_scene("res://Telas/3-Planejamento.tscn")

func _on_Iniciar_proj_mouse_entered():
	$Iniciar_proj.modulate = 'd2d2d2'

func _on_Iniciar_proj_mouse_exited():
	$Iniciar_proj.modulate = 'ffffff'
