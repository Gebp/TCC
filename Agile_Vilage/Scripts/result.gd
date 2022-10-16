extends Node

var madeira = 0
var pedra = 0
var areia = 0
var minerais = 0
var carvao = 0
var vidro = 0
var moedas = 0
var conhecimento = 1
var energia = 0
var sprint = 0

func _ready():
	info_proj()
	events()
	feedback()

func info_proj():
	$Resultados/InfoProj/Texto.bbcode_enabled = true
	$Resultados/InfoProj/Texto.bbcode_text = 'Nº total de Sprints: ' + str(GlobalVar.qtd_sprint + 1) + '\n' + str(GlobalVar.qtd_sprint) + ' (Previsão) + 1 (Sprint 0)\n\nNº de Sprints completas jogadas: ' + str(GlobalVar.sprint + 1) + '\n\n[center]-- Objetivos --[/center]\n\n' + str(obj()) + '\n[center]-- Mínimos necessários --[/center]\n\n' + str(materiais())

func obj():
	var txt = ''
	if GlobalVar.obj_casas > 0:
		txt += 'Qtd de Casas: ' + str(GlobalVar.casas) + ' de ' + str(GlobalVar.obj_casas)
		if GlobalVar.casas >= GlobalVar.obj_casas:
			txt += '(Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_muros > 0:
		txt += 'Qtd de Muros: ' + str(GlobalVar.muros) + ' de ' + str(GlobalVar.obj_muros)
		if GlobalVar.muros >= GlobalVar.obj_muros:
			txt += '(Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_torres > 0:
		txt += 'Qtd de Torres: ' + str(GlobalVar.torres) + ' de ' + str(GlobalVar.obj_torres)
		if GlobalVar.torres >= GlobalVar.obj_torres:
			txt += '(Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_fazendas > 0:
		txt += 'Qtd de Fazendas: ' + str(GlobalVar.fazendas) + ' de ' + str(GlobalVar.obj_fazendas)
		if GlobalVar.fazendas >= GlobalVar.obj_fazendas:
			txt += '(Concluído)\n'
		else:
			txt += '\n'
	return txt

func materiais():
	if GlobalVar.obj_casas > 0:
		# 8 Madeiras, 4 vidros e 5 Pedras + 5 Energias
		madeira += 8 * GlobalVar.obj_casas
		vidro += 4 * GlobalVar.obj_casas
		pedra += 5 * GlobalVar.obj_casas
		energia += 5 * GlobalVar.obj_casas
		conhecimento = 2
	if GlobalVar.obj_muros > 0:
		# 4 Pedras + 2 Madeiras + 2 Energias
		pedra += 4 * GlobalVar.obj_muros
		madeira += 2 * GlobalVar.obj_muros
		energia += 2 * GlobalVar.obj_muros
	if GlobalVar.obj_torres > 0:
		# 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias
		pedra += 12 * GlobalVar.obj_torres
		madeira += 6 * GlobalVar.obj_torres
		vidro += 5 * GlobalVar.obj_torres
		energia += 6 * GlobalVar.obj_torres
		conhecimento = 3
	if GlobalVar.obj_fazendas > 0:
		# 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias
		madeira += 12 * GlobalVar.obj_fazendas
		vidro += 4 * GlobalVar.obj_fazendas
		pedra += 4 * GlobalVar.obj_fazendas
		energia += 6 * GlobalVar.obj_fazendas
		conhecimento = 4
	# 5 Areias + 2 Carvões + 2 Energias
	areia += 5 * vidro
	energia += 2 * vidro
	# 3 Moedas * Conhecimento + 2 Energias * Conhecimento
	var n = 1
	while n < conhecimento + 1:
		moedas += 3 * n
		energia += 2 * n
		n += 1
	# 1 Mineral + 2 Carvões + 1 Energia
	minerais += moedas
	energia += 2 * carvao
	carvao += 2 * areia + 2 * carvao
	# Padrão de 10 energias por Sprint
	sprint = energia / 10
	if (energia % 10) != 0:
		sprint = int(sprint) + 1
	return 'Madeira: ' + str(madeira) +'\nPedra: ' + str(pedra) +'\nCarvão: ' + str(carvao) + '\nAreia: ' + str(areia) + '\nVidro: ' + str(vidro) + '\nMinerais: ' + str(minerais) + '\nMoedas: ' + str(moedas) + '\nConhecimento: ' + str(conhecimento) + '\nEnergia: ' + str(energia) + '\nSprints: ' + str(sprint)

func events():
	$Resultados/Eventos/Texto.bbcode_enabled = true
	$Resultados/Eventos/Texto.bbcode_text = '[center]-- Ações realizadas --[/center]\n\n' + str(acoes()) + '[center]-- Eventos --[/center]\n\nTotal: ' + str(GlobalVar.micro_eventos + GlobalVar.eventos_inevitaveis + GlobalVar.eventos_selecionaveis) + '\n\n[center]-- Eventos de Energia --[/center]\n\nQtd de alterações no limite de energia: ' + str(GlobalVar.micro_eventos) + '\n\nEnergia Adicionada: ' + str(GlobalVar.bonus_energia) + '\nEnergia Reduzida: ' + str(GlobalVar.onus_energia) + '\nVariação de Energia: ' + str(GlobalVar.bonus_energia - GlobalVar.onus_energia) + '\n\n[center]-- Eventos de Inevitáveis --[/center]\n\nQtd de Atrasos: ' + str(GlobalVar.eventos_inevitaveis) + str(eventos_inevitaveis()) + '\n\n[center]-- Eventos de Seleção --[/center]\n\nQtd de Auxílios: ' + str(GlobalVar.eventos_selecionaveis) + str(eventos_selecionaveis())

func acoes():
	var coleta = ''
	
	if GlobalVar.t_madeira > 0:
		coleta += 'Madeira: ' + str(GlobalVar.t_madeira) + '\n'
	if GlobalVar.t_pedra > 0:
		coleta += 'Pedra: ' + str(GlobalVar.t_pedra) + '\n'
	if GlobalVar.t_areia > 0:
		coleta += 'Areia: ' + str(GlobalVar.t_areia) + '\n'
	if GlobalVar.t_minerais > 0:
		coleta += 'Minerais: ' + str(GlobalVar.t_minerais) + '\n'
	if GlobalVar.t_carvao > 0:
		coleta += 'Carvão: ' + str(GlobalVar.t_carvao) + '\n'
	if coleta == '':
		coleta = 'Nenhum item coletado\n'
	
	var criacao = ''
	
	if GlobalVar.t_vidro > 0:
		criacao += 'Vidro: ' + str(GlobalVar.t_vidro) + '\n'
	if GlobalVar.t_moeda > 0:
		criacao += 'Moeda: ' + str(GlobalVar.t_moeda) + '\n'
	if criacao == '':
		criacao = 'Nenhum material criado\n'
	
	var melhoria = ''
	
	if GlobalVar.a_limite_madeira > 0:
		melhoria += 'Aumento do limite de Madeira: ' + str(GlobalVar.a_limite_madeira) + '\n'
	if GlobalVar.a_limite_pedra > 0:
		melhoria += 'Aumento do limite de Pedra: ' + str(GlobalVar.a_limite_pedra) + '\n'
	if GlobalVar.a_limite_areia > 0:
		melhoria += 'Aumento do limite de Areia: ' + str(GlobalVar.a_limite_areia) + '\n'
	if GlobalVar.a_limite_minerais > 0:
		melhoria += 'Aumento do limite de Minerais: ' + str(GlobalVar.a_limite_minerais) + '\n'
	if GlobalVar.a_limite_carvao > 0:
		melhoria += 'Aumento do limite de Carvão: ' + str(GlobalVar.a_limite_carvao) + '\n'
	if GlobalVar.a_limite_vidro > 0:
		melhoria += 'Aumento do limite de Vidro: ' + str(GlobalVar.a_limite_vidro) + '\n'
	if GlobalVar.a_limite_moeda > 0:
		melhoria += 'Aumento do limite de Moeda: ' + str(GlobalVar.a_limite_moeda) + '\n'
	if melhoria == '':
		melhoria = 'Nenhuma melhoria feita\n'

	return 'Recursos coletados:\n' + str(coleta) + '\nMateriais criados:\n' + str(criacao) + '\nMelhorias realizadas:\n' + str(melhoria) + '\n\n'

func eventos_inevitaveis():
	return ''

func eventos_selecionaveis():
	return ''

func feedback():
	$Resultados/Feedback/Texto.bbcode_enabled = true
	$Resultados/Feedback/Texto.bbcode_text = ''
