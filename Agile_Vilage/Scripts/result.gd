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
# Validação de construção extras
var casas_e = 0
var muros_e = 0
var torres_e = 0
var fazendas_e = 0
# Validação da conclusão dos objetivos
var obj_t = 0
var obj_c = 0
# Validador do parcial
var obj_p = obj_t / 2
# Pontos Positivos e Pontos Negativos
var pp = 0
var pn = 0

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
	if GlobalVar.obj_muros > 0:
		# 4 Pedras + 2 Madeiras + 2 Energias
		pedra += 4 * GlobalVar.obj_muros
		madeira += 2 * GlobalVar.obj_muros
		energia += 2 * GlobalVar.obj_muros
	if GlobalVar.obj_casas > 0:
		# 8 Madeiras, 4 vidros e 5 Pedras + 5 Energias
		madeira += 8 * GlobalVar.obj_casas
		vidro += 4 * GlobalVar.obj_casas
		pedra += 5 * GlobalVar.obj_casas
		energia += 5 * GlobalVar.obj_casas
		conhecimento = 2
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
	while n <= conhecimento:
		moedas += 3 * n
		energia += 2 * n
		n += 1
	# 1 Mineral + 2 Carvões + 1 Energia
	minerais += moedas
	energia += 2 * carvao
	carvao += 2 * areia + 2 * minerais
	# Padrão de 10 energias por Sprint
	sprint = energia / 10
	if (energia % 10) != 0:
		sprint = int(sprint) + 1
	return 'Madeira: ' + str(madeira) +'\nPedra: ' + str(pedra) +'\nCarvão: ' + str(carvao) + '\nAreia: ' + str(areia) + '\nVidro: ' + str(vidro) + '\nMinerais: ' + str(minerais) + '\nMoedas: ' + str(moedas) + '\n\nConhecimento: ' + str(conhecimento) + '\nEnergia: ' + str(energia) + '\nSprints: ' + str(sprint)

func events():
	$Resultados/Eventos/Texto.bbcode_enabled = true
	$Resultados/Eventos/Texto.bbcode_text = '[center]-- Ações realizadas --[/center]\n\n' + str(acoes()) + '[center]-- Eventos --[/center]\n\nTotal: ' + str(GlobalVar.micro_eventos + GlobalVar.eventos_inevitaveis + GlobalVar.eventos_selecionaveis) + '\n\n[center]-- Eventos de Energia --[/center]\n\nQtd de alterações no limite de energia: ' + str(GlobalVar.micro_eventos) + '\n\nEnergia Adicionada: ' + str(GlobalVar.bonus_energia) + '\nEnergia Reduzida: ' + str(GlobalVar.onus_energia) + '\nVariação de Energia: ' + str(GlobalVar.bonus_energia - GlobalVar.onus_energia) + '\n\n[center]-- Eventos de Inevitáveis --[/center]\n\nQtd de Atrasos: ' + str(GlobalVar.eventos_inevitaveis) + str(eventos_inevitaveis()) + '\n\n[center]-- Eventos de Seleção --[/center]\n\nQtd de Auxílios: ' + str(GlobalVar.eventos_selecionaveis) + str(eventos_selecionaveis())

# Validações das ações realizadas pelo jogador
func acoes():
	var coleta = ''
	# Validação dos itens coletados nos campos do mapa
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
	# Validação dos itens criados na forja
	if GlobalVar.t_vidro > 0:
		criacao += 'Vidro: ' + str(GlobalVar.t_vidro) + '\n'
	if GlobalVar.t_moeda > 0:
		criacao += 'Moeda: ' + str(GlobalVar.t_moeda) + '\n'
	if criacao == '':
		criacao = 'Nenhum material criado\n'
	
	var melhoria = ''
	# Validação das melhorias realizadas
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
	if GlobalVar.conhecimento > 1:
		melhoria += 'Conhecimento aumentado para: ' + str(GlobalVar.conhecimento)
		if GlobalVar.conhecimento == 4:
			melhoria += ' (Máximo)\n'
		else:
			melhoria += '\n'
	if melhoria == '':
		melhoria = 'Nenhuma melhoria feita\n'

	return 'Recursos coletados:\n\n' + str(coleta) + '\n\nMateriais criados:\n' + str(criacao) + '\nMelhorias realizadas:\n\n' + str(melhoria) + '\n\n'

func eventos_inevitaveis():
	return ''

func eventos_selecionaveis():
	return ''

func feedback():
	# Validar: Objetivos completados, Previsão de Sprints, Recursos Coletados e Materiais criados, Construções
	# Considerar quantidades, para validar a questão de priorização de itens e construções
	$Resultados/Feedback/Texto.bbcode_enabled = true
	$Resultados/Feedback/Texto.bbcode_text = '[center]-- Objetivos --[/center]\n\n' + valida_result() + '\n[center]-- Desempenho --[/center]\n\n' + desempenho() + '\n[center]-- Previsão de Sprints --[/center]\n\n' + previsao_sprint()

func valida_result():
	var retrabalho = ''
	var excesso = ''
	var conclusao = ''
	
	if GlobalVar.obj_casas > 0:
		obj_t += 1
		if GlobalVar.c_obj_casas[0]:
			obj_c += 1
		if GlobalVar.r_obj_casas > 0:
			retrabalho += 'Casas: ' + str(GlobalVar.r_obj_casas) + '\n'
	if GlobalVar.casas > GlobalVar.obj_casas:
		casas_e = GlobalVar.casas - GlobalVar.obj_casas
		if casas_e == 1:
			excesso += str(casas_e) + ' casa\n'
		else:
			excesso += str(casas_e) + ' casas\n'
	if GlobalVar.obj_muros > 0:
		obj_t += 1
		if GlobalVar.c_obj_muros[0]:
			obj_c += 1
		if GlobalVar.r_obj_muros > 0:
			retrabalho += 'Muros: ' + str(GlobalVar.r_obj_muros) + '\n'
	if GlobalVar.muros > GlobalVar.obj_muros:
		muros_e = GlobalVar.muros - GlobalVar.obj_muros
		if muros_e == 1:
			excesso += str(muros_e) + ' muro\n'
		else:
			excesso += str(muros_e) + ' muros\n'
	if GlobalVar.obj_torres > 0:
		obj_t += 1
		if GlobalVar.c_obj_torres[0]:
			obj_c += 1
		if GlobalVar.r_obj_torres > 0:
			retrabalho += 'Torres: ' + str(GlobalVar.r_obj_torre) + '\n'
	if GlobalVar.torres > GlobalVar.obj_torres:
		torres_e = GlobalVar.torres - GlobalVar.obj_torres
		if torres_e == 1:
			excesso += str(torres_e) + ' torre\n'
		else:
			excesso += str(torres_e) + ' torres\n'
	if GlobalVar.obj_fazendas > 0:
		obj_t += 1
		if GlobalVar.c_obj_fazendas[0]:
			obj_c += 1
		if GlobalVar.r_obj_fazendas > 0:
			retrabalho += 'Fazendas: ' + str(GlobalVar.r_obj_fazendas) + '\n'
	if GlobalVar.fazendas > GlobalVar.obj_fazendas:
		fazendas_e = GlobalVar.fazendas - GlobalVar.obj_fazendas
		if fazendas_e == 1:
			excesso += str(fazendas_e) + ' fazenda\n'
		else:
			excesso += str(fazendas_e) + ' fazendas\n'
	
	if retrabalho == '':
		retrabalho += 'Não houve\n'
	if excesso == '':
		excesso += 'Não houve\n'
	
	if obj_c <= 1:
		conclusao = str(obj_c) + ' objetivo de ' + str(obj_t) + '\n'
	else:
		conclusao = str(obj_c) + ' objetivos de ' + str(obj_t) + '\n'
	
	return 'Concluído ' + conclusao + '\nRetrabalho para concluir os objetivos\n' + retrabalho + '\nConstruções à mais\n' + excesso

func desempenho():
	var desempenho_obj = ''
	var consideracoes_obj = ''
	
	if obj_t % 2 != 0:
		obj_p = int(obj_p) + 1
	
	if obj_c == obj_t:
		desempenho_obj = 'Perfeito'
	elif obj_c >= obj_p:
		desempenho_obj = 'Parcialmente satisfatório'
	else:
		desempenho_obj = 'Insatisfatório'
	
	if desempenho_obj == 'Perfeito':
		consideracoes_obj = 'Você conseguiu cumprir todos os objetivos deixando todos os aldeiões, seus clientes, felizes e satisfeitos com o seu trabalho.\n'
		pp += 1
	elif desempenho_obj == 'Parcialmente satisfatório':
		consideracoes_obj = 'Você conseguiu cumprir parcialmente seus objetivos. As opiniões dos aldeiões, seus clientes, se dividem quanto ao seu trabalho, alguns acreditam que com um pouco mais de tempo você conseguiria concluir tudo que se propôs a fazer, outros estão indiferentes, nem decepcionados pelo que você não fez, nem muito felizes com o que foi entregue, mas há aqueles, te veem como alguém incompente.\n'
	elif desempenho_obj == 'Insatisfatório':
		consideracoes_obj = 'Você não conseguiu cumprir uma quantidade adequada de objetivos. Os aldeiões, seus clientes, estão completamente insatisfeitos com seus trabalho, decepcionados por terem recebido promessas, mas pouco retorno.\n'
		pn += 1
	
	return 'O seu desempenho foi ' + desempenho_obj + '.\n' + consideracoes_obj

func previsao_sprint():
	pass
