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
# fim real
var fim_real = 0

func _ready():
	info_proj()
	events()
	feedback()

# Informações gerais sobre o projeto
func info_proj():
	$Resultados/InfoProj/Texto.bbcode_enabled = true
	$Resultados/InfoProj/Texto.bbcode_text = 'Nº total de Sprints: ' + str(GlobalVar.qtd_sprint + 1) + '\n' + str(GlobalVar.qtd_sprint) + ' (Previsão) + 1 (Sprint 0)\n\nNº de Sprints completas jogadas: ' + str(GlobalVar.sprint + 1) + '\n\n[center]-- Objetivos --[/center]\n\n' + str(obj()) + '\n[center]-- Mínimos necessários --[/center]\n\n' + str(materiais())

func obj():
	var txt = ''
	if GlobalVar.obj_casas > 0:
		txt += 'Qtd de Casas: ' + str(GlobalVar.casas) + ' de ' + str(GlobalVar.obj_casas)
		if GlobalVar.casas >= GlobalVar.obj_casas:
			txt += ' (Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_muros > 0:
		txt += 'Qtd de Muros: ' + str(GlobalVar.muros) + ' de ' + str(GlobalVar.obj_muros)
		if GlobalVar.muros >= GlobalVar.obj_muros:
			txt += ' (Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_torres > 0:
		txt += 'Qtd de Torres: ' + str(GlobalVar.torres) + ' de ' + str(GlobalVar.obj_torres)
		if GlobalVar.torres >= GlobalVar.obj_torres:
			txt += ' (Concluído)\n'
		else:
			txt += '\n'
	if GlobalVar.obj_fazendas > 0:
		txt += 'Qtd de Fazendas: ' + str(GlobalVar.fazendas) + ' de ' + str(GlobalVar.obj_fazendas)
		if GlobalVar.fazendas >= GlobalVar.obj_fazendas:
			txt += ' (Concluído)\n'
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
	# Vidro = 5 Areias + 2 Carvões + 2 Energias
	areia += 5 * vidro
	energia += 2 * vidro
	# Conhecimento = 3 Moedas * Conhecimento + 2 Energias * Conhecimento
	var n = 1
	while n <= conhecimento:
		moedas += 3 * n
		energia += 2 * n
		n += 1
	# Moeda = 1 Mineral + 2 Carvões + 1 Energia
	minerais += moedas
	energia += 2 * moedas
	carvao += 2 * vidro + 2 * moedas
	# Padrão de 10 energias por Sprint
	sprint = energia / 10
	if (energia % 10) != 0:
		sprint = int(sprint) + 1
	return 'Madeira: ' + str(madeira) +'\nPedra: ' + str(pedra) +'\nCarvão: ' + str(carvao) + '\nAreia: ' + str(areia) + '\nVidro: ' + str(vidro) + '\nMinerais: ' + str(minerais) + '\nMoedas: ' + str(moedas) + '\n\nConhecimento: ' + str(conhecimento) + '\nEnergia: ' + str(energia) + '\nSprints: ' + str(sprint)

# Exposição dos eventos do jogo
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

	return 'Recursos coletados:\n' + str(coleta) + '\n\nMateriais criados:\n' + str(criacao) + '\nMelhorias realizadas:\n' + str(melhoria) + '\n\n'

func eventos_inevitaveis():
	return ''

func eventos_selecionaveis():
	return ''

# Análise dos resultados
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
		consideracoes_obj = 'Você conseguiu cumprir todos os objetivos deixando todos os aldeiões, seus clientes, felizes e satisfeitos com o seu trabalho.\n\nApesar da entrega ter sido feita em sua completude, avalie fatores menores que podem ter feito você ter alguma dificuldade, como a desconsideração com os empecilhos, ou priorizações mal executadas, faça os ajustes necessários e continue sempre melhorando.\n'
		pp += 1
	elif obj_c >= obj_p:
		desempenho_obj = 'Parcialmente satisfatório'
		consideracoes_obj = 'Você conseguiu cumprir parcialmente seus objetivos. As opiniões dos aldeiões, seus clientes, se dividem quanto ao seu trabalho, alguns acreditam que com um pouco mais de tempo você conseguiria concluir tudo que se propôs a fazer, outros estão indiferentes, nem decepcionados pelo que você não fez, nem muito felizes com o que foi entregue, mas há aqueles, te veem como alguém incompente.\n\nApesar do resultado ser satisfatório, reavalie a estimativa de tempo, veja se os empecilhos e o tamanho do projeto foram considerados, e se atente às priorizações feitas, alguma delas pode ter sido realizada de forma incorreta, direcionando esforços para locais indevidos ou desnecessários.\n'
	else:
		desempenho_obj = 'Insatisfatório'
		consideracoes_obj = 'Você não conseguiu cumprir uma quantidade adequada de objetivos. Os aldeiões, seus clientes, estão completamente insatisfeitos com seus trabalho, decepcionados por terem recebido promessas, mas pouco retorno.\n\nUma dica para melhorar é reavaliar a dificuldade do projeto selecionado, pois você pode ter assumido um projeto mais complexo do que estava preparado, ou não compreendeu o que se esperava dele, logo em seguida, reveja a estimativa de tempo, é importante que informe um prazo realista, que leve em consideração possíveis empecilhos, e ao longo da execução se atente mais ao que deve ser priorizado, pois a falta de priorização pode estar direcionando os esforços para locais desnecessários.\n'
		pn += 1
	
	return 'O seu desempenho foi ' + desempenho_obj + '.\n' + consideracoes_obj

func previsao_sprint():
	var dif_sprint = GlobalVar.qtd_sprint - GlobalVar.sprint
	var previsao = ''
	var consideracoes_P = ''
	
	if obj_c == obj_t:
		fim_real = fim_real_sprint()

	# Escala:
	# 1. Perfeita
	# 2. Muito boa
	# 3. Mediana
	# 4. Insuficiente
	
	# Caso os objetivos tenha sido completados dentro da quantidade de Sprints proposta
	if dif_sprint == 0 and obj_c == obj_t:
		if sprint == fim_real:
			previsao = 'Perfeita'
			consideracoes_P = 'Você apresentou alta capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto de forma balanceada, nem extendendo muito o prazo, nem deixando todos os prazos muito apertados.\n'
		elif sprint - fim_real <= 2:
			previsao = 'Muito boa'
			consideracoes_P = 'Você apresentou alta capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto de forma balanceada, tendo pouco erro ao realizar a previsão.\n\nUma dica para tornar a previsão mais acertiva e reavaliar se todas as dificuldades pensadas são empecilhos grandiosos, ou se são apenas problemas pequenos que podem rapidamente ser resolvidos.\n'
		elif sprint - fim_real <= 5:
			previsao = 'Mediana'
			consideracoes_P = 'Você apresentou boa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, mas previu um prazo extra mais extenso que o adequado.\n\nUma dica para melhorar a previsão é reavaliar as necessidades do projeto, para identificar se algo não foi considerado de forma incorreta, e revisar quais empecilhos foram identificados que poderiam atrapalhar o andamento do projeto, mas podem ser resolvidos de forma rápida, sem a necessidade de um tempo dedicado para correção.\n'
		else:
			previsao = 'Insuficiente'
			consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, a previsão se mostrou muito incorreta e muito além do necessário, apesar de ter completado todos os objetivos propostos e ter seguido até o fim.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que não tenham sido necessárias tantas Sprints quanto foi planejado, outro ponto de atenção são os empecilhos identificados, alguns deles podem não ser tão grandiosos quanto foi pensado inicialmente, não havendo necessidade de reservar tanto tempo para correção de possíveis problemas.\n'
	# Caso os objetivos tenham sido completados, mas as Spritns foram encerradas de forma antecipada
	elif dif_sprint > 0 and obj_c == obj_t:
		if sprint - dif_sprint == fim_real:
			if dif_sprint <= 2:
				previsao = 'Muito boa'
				consideracoes_P = 'Você apresentou alta capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto de forma balanceada, tendo pouco erro ao realizar a previsão, decidindo encerrar de forma antecipada, visto que tudo já havia sido entregue conforme o planejado.\n\nUma dica para tornar a previsão mais acertiva e reavaliar se todas as dificuldades pensadas são empecilhos grandiosos, ou se são apenas problemas pequenos que podem rapidamente ser resolvidos.\n'
			elif dif_sprint <= 5:
				previsao = 'Mediana'
				consideracoes_P = 'Você apresentou boa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, mas previu um prazo mais extenso que o adequado, decidindo encerrar de forma antecipada, visto que tudo já havia sido entregue conforme o planejado.\n\nUma dica para melhorar a previsão é reavaliar as necessidades do projeto, para identificar se algo não foi considerado de forma incorreta, e revisar quais empecilhos foram identificados que poderiam atrapalhar o andamento do projeto, mas podem ser resolvidos de forma rápida, sem a necessidade de um tempo dedicado para correção.\n'
			else:
				previsao = 'Insuficiente'
				consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, a previsão se mostrou muito incorreta e muito além do necessário, apesar de ter completado todos os objetivos propostos e, por conta disso, enecerrado de forma antecipada.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que não tenham sido necessárias tantas Sprints quanto foi planejado, outro ponto de atenção são os empecilhos identificados, alguns deles podem não ser tão grandiosos quanto foi pensado inicialmente, não havendo necessidade de reservar tanto tempo para correção de possíveis problemas.\n'
		elif sprint - dif_sprint - fim_real <= 2:
			if dif_sprint <= 2:
				previsao = 'Mediana'
				consideracoes_P = 'Você apresentou boa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, mas previu um prazo extra mais extenso que o adequado, decidindo encerrar de forma antecipada, visto que tudo já havia sido entregue conforme o planejado.\n\nUma dica para melhorar a previsão é reavaliar as necessidades do projeto, para identificar se algo não foi considerado de forma incorreta, e revisar quais empecilhos foram identificados que poderiam atrapalhar o andamento do projeto, mas podem ser resolvidos de forma rápida, sem a necessidade de um tempo dedicado para correção.\n'
			else:
				previsao = 'Insuficiente'
				consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, a previsão se mostrou muito incorreta e muito além do necessário, apesar de ter completado todos os objetivos propostos e, por conta disso, enecerrado de forma antecipada.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que não tenham sido necessárias tantas Sprints quanto foi planejado, outro ponto de atenção são os empecilhos identificados, alguns deles podem não ser tão grandiosos quanto foi pensado inicialmente, não havendo necessidade de reservar tanto tempo para correção de possíveis problemas.\n'
		else:
			previsao = 'Insuficiente'
			consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, a previsão se mostrou muito incorreta e muito além do necessário, apesar de ter completado todos os objetivos propostos e, por conta disso, enecerrado de forma antecipada.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que não tenham sido necessárias tantas Sprints quanto foi planejado, outro ponto de atenção são os empecilhos identificados, alguns deles podem não ser tão grandiosos quanto foi pensado inicialmente, não havendo necessidade de reservar tanto tempo para correção de possíveis problemas.\n'
	# Caso a quantidade de Sprints tenha chego ao fim, mas os objetivos não tenham sido completados
	elif dif_sprint == 0 and obj_c < obj_t:
		if obj_c >= obj_p:
			previsao = 'Mediana'
			consideracoes_P = 'Você apresentou boa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, prevendo um prazo menor que o adequado, dessa forma, sendo incapaz de concluir tudo que havia sido proposto.\n\nUma dica para melhorar a previsão é reavaliar as necessidades do projeto, para identificar se algo não foi considerado de forma incorreta, e revisar quais empecilhos foram identificados que poderiam atrapalhar o andamento do projeto, mas podem ser resolvidos de forma rápida, sem a necessidade de um tempo dedicado para correção, também, é imporante reassaltar que ao longo da execução do projeto, reveja a priorização das atividades, para evitar alocação de esforço e gastos de recursos de forma desnecessária.\n'
		else:
			previsao = 'Insuficiente'
			consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, prevendo um prazo menor que o adequado, dessa forma, sendo incapaz de concluir tudo que havia sido proposto.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que algo não tenha sido considerado, como as necessidade do projeto ou os empecilhos, que podem ter sido desconsiderados ou mal avaliados, é imporante também reavaliar a execução do projeto, a priorização das atividades pode ter sido feita de forma inadequada, levando desperdício de esforço e recursos, que poderiam ter sido utilizados de forma mais eficientes em outro local.\n'
	# Caso os objetivos não tenham sido completado e as Sprints tenham sido encerradas antecipadamente
	elif dif_sprint > 0 and obj_c < obj_t:
		previsao = 'Insuficiente'
		consideracoes_P = 'Você apresentou baixa capacidade de identificar a quantidade de Sprints necessárias para a realização do projeto, não conseguindo prever um prazo adequado, nem sedo capaz de trazer resultados relevantes para o projeto.\n\nUma dica é reavaliar a dificuldade do projeto e o tamanho do escopo, pode ser que algo não tenha sido considerado, como as necessidade do projeto ou os empecilhos, que podem ter sido desconsiderados ou mal avaliados, é imporante também reavaliar a execução do projeto, a priorização das atividades pode ter sido feita de forma inadequada, levando desperdício de esforço e recursos, que poderiam ter sido utilizados de forma mais eficientes em outro local.\n'
		
	return 'A sua capacidade de previsão foi ' + previsao + '.\n' + consideracoes_P

func fim_real_sprint():
	var fim = 0
	var fim_obj = []
	
	if GlobalVar.obj_casas > 0:
		fim_obj.append(GlobalVar.c_obj_casas[1])
	if GlobalVar.obj_muros > 0:
		fim_obj.append(GlobalVar.c_obj_muros[1])
	if GlobalVar.obj_torres > 0:
		fim_obj.append(GlobalVar.c_obj_torres[1])
	if GlobalVar.obj_fazendas > 0:
		fim_obj.append(GlobalVar.c_obj_fazendas[1])
	
	for s in fim_obj:
		if s > fim:
			fim = s
	
	return fim
