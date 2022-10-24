extends Node

var r = RandomNumberGenerator.new()

# Função para deixar os ganhos de maeriasi de forma randômica, replicado para todos os tipo
func randomizar_ganhos() -> int:
	r.randomize()
	return int(r.randf_range(1, 3.1))

func reduzir_energia(e):
	GlobalVar.energia -= int(e)
	GlobalVar.t_energia += int(e)
	$Menu_lateral/EnergiaBar.value = GlobalVar.energia
	$Menu_lateral/EnergiaBar/Energia.text = str(GlobalVar.energia) + '/' + str(GlobalVar.limite_energia)

# Botões de recursos naturais
func _on_BtnMadeira_pressed():
	if GlobalVar.energia > 0 and GlobalVar.madeira < GlobalVar.limite_madeira:
		var i = randomizar_ganhos()
		GlobalVar.t_madeira += i
		GlobalVar.madeira += i
		if GlobalVar.madeira > GlobalVar.limite_madeira:
			GlobalVar.madeira = GlobalVar.limite_madeira
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		reduzir_energia(1)

func _on_BtnPedra_pressed():
	if GlobalVar.energia > 0 and GlobalVar.pedra < GlobalVar.limite_pedra:
		var i = randomizar_ganhos()
		GlobalVar.t_pedra += i
		GlobalVar.pedra += i
		if GlobalVar.pedra > GlobalVar.limite_pedra:
			GlobalVar.pedra = GlobalVar.limite_pedra
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		reduzir_energia(1)

func _on_BtnAreia_pressed():
	if GlobalVar.energia > 0 and GlobalVar.areia < GlobalVar.limite_areia:
		var i = randomizar_ganhos()
		GlobalVar.t_areia += i
		GlobalVar.areia += i
		if GlobalVar.areia > GlobalVar.limite_areia:
			GlobalVar.areia = GlobalVar.limite_areia
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		reduzir_energia(1)

func _on_BtnMinerais_pressed():
	if GlobalVar.energia > 0 and GlobalVar.minerais < GlobalVar.limite_minerais:
		var i = randomizar_ganhos()
		GlobalVar.t_minerais += i
		GlobalVar.minerais += i
		if GlobalVar.minerais > GlobalVar.limite_minerais:
			GlobalVar.minerais = GlobalVar.limite_minerais
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		reduzir_energia(1)

func _on_BtnCarvao_pressed():
	if GlobalVar.energia > 0 and GlobalVar.carvao < GlobalVar.limite_carvao:
		var i = randomizar_ganhos()
		GlobalVar.t_carvao += i
		GlobalVar.carvao += i
		if GlobalVar.carvao > GlobalVar.limite_carvao:
			GlobalVar.carvao = GlobalVar.limite_carvao
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		reduzir_energia(1)

# Botões de Pop Up
func _on_BtnVila_pressed():
	$PopVila1.popup_centered()
	# Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4 or GlobalVar.conhecimento < 2:
		if GlobalVar.conhecimento < 2:
			$PopVila1/BtnCasa.hint_tooltip = 'Sem conhecimento suficiente'
		else:
			$PopVila1/BtnCasa.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnCasa.disabled = true
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnCasa.disabled = false
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Muro = 4 Pedras + 2 Madeiras + 2 Energias
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila1/BtnMuro.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnMuro.disabled = true
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnMuro.disabled = false
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5 or GlobalVar.conhecimento < 3:
		if GlobalVar.conhecimento < 3:
			$PopVila1/BtnTorre.hint_tooltip = 'Sem conhecimento suficiente'
		else:
			$PopVila1/BtnTorre.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnTorre.disabled = true
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnTorre.disabled = false
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Fazenda = 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4 or GlobalVar.conhecimento < 4:
		if GlobalVar.conhecimento < 4:
			$PopVila1/BtnFazenda.hint_tooltip = 'Sem conhecimento suficiente'
		else:
			$PopVila1/BtnFazenda.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnFazenda.disabled = true
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnFazenda.disabled = false
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Recursos = 8 Moedas + 4 Energias
	if GlobalVar.energia < 4 or GlobalVar.moeda < 8:
		$PopVila2/BtnRecursos.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnRecursos.disabled = true
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnRecursos.disabled = false
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Materiais = 4 Moedas + 2 Energias
	if GlobalVar.energia < 2 or GlobalVar.moeda < 4:
		$PopVila2/BtnMateriais.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnMateriais.disabled = true
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnMateriais.disabled = false
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Conhecimento = 3 * nivel Moedas + 2 * nivel Energias
	if GlobalVar.conhecimento <= 3:
		if GlobalVar.conhecimento == 1:
			$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento I'
		elif GlobalVar.conhecimento == 2:
			$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento II'
		elif GlobalVar.conhecimento == 3:
			$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento III'
		$PopVila2/BtnConhecimento/DetalheText.text = 'Adquira conhecimento e desbloqueie:\n\nConhecimento II - Casa\nConhecimento III - Torre\nConhecimento IV - Fazenda\n\nCusto:\n'+ str(3 * GlobalVar.conhecimento) + ' Moedas\n' + str(2 * GlobalVar.conhecimento) + ' Energias'
	else:
		$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento IV'
		$PopVila2/BtnConhecimento/DetalheText.text = 'Adquira conhecimento e desbloqueie:\n\nConhecimento II - Casa\nConhecimento III - Torre\nConhecimento IV - Fazenda\n\nCusto:\nNão há mais nada para aprender'
	if GlobalVar.energia < 2 * GlobalVar.conhecimento or GlobalVar.moeda < 3 * GlobalVar.conhecimento or GlobalVar.conhecimento == 4:
		if GlobalVar.conhecimento < 4:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		else:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Conhecimento máximo alcançado'
		$PopVila2/BtnConhecimento.disabled = true
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnConhecimento.disabled = false
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_Pagina_pressed():
	if $PopVila1.visible:
		$PopVila1.hide()
		$PopVila2.popup_centered()
	elif $PopVila2.visible:
		$PopVila2.hide()
		$PopVila1.popup_centered()

func _on_Pagina_mouse_entered():
	if $PopVila1.visible:
		$PopVila1/Pagina.hint_tooltip = 'Página de Mlehorias'
		$PopVila1/Pagina.modulate = 'd2d2d2'
	if $PopVila2.visible:
		$PopVila2/Pagina.hint_tooltip = 'Página de Construções'
		$PopVila2/Pagina.modulate = 'd2d2d2'

func _on_Pagina_mouse_exited():
	if $PopVila1.visible:
		$PopVila1/Pagina.modulate = 'ffffff'
	if $PopVila2.visible:
		$PopVila2/Pagina.modulate = 'ffffff'

func _on_BtnForja_pressed():
	$PopForja.popup_centered()
	# Vidro = 5 Areias + 2 Carvões + 2 Energias
	if GlobalVar.energia < 2 or GlobalVar.areia < 5 or GlobalVar.carvao < 2 or GlobalVar.vidro == GlobalVar.limite_vidro:
		$PopForja/BtnVidro.disabled = true
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnVidro.disabled = false
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Moeda = 1 Mineral + 2 Carvões + 1 Energia
	if GlobalVar.energia < 1 or GlobalVar.minerais < 1 or GlobalVar.carvao < 2 or GlobalVar.moeda == GlobalVar.limite_moeda:
		$PopForja/BtnMoeda.disabled = true
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnMoeda.disabled = false
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

# Botões de Construções
func _on_BtnCasa_pressed():
	# 8 Madeiras, 4 vidros e 5 Pedras + 5 Energias
	if GlobalVar.energia >= 5 and GlobalVar.madeira >= 8 and GlobalVar.pedra >= 5 and GlobalVar.vidro >= 4 and GlobalVar.conhecimento >= 2:
		GlobalVar.madeira -= 8
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		GlobalVar.pedra -= 5
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		GlobalVar.vidro -= 4
		$Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
		$Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		GlobalVar.casas += 1
		$Menu_lateral/Construcoes/Casas.text = 'Casas: ' + str(GlobalVar.casas)
		reduzir_energia(5)
	# Disable automático
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila1/BtnCasa.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnCasa.disabled = true
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnCasa.disabled = false
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila1/BtnMuro.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnMuro.disabled = true
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnMuro.disabled = false
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila1/BtnTorre.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnTorre.disabled = true
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnTorre.disabled = false
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila1/BtnFazenda.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnFazenda.disabled = true
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnFazenda.disabled = false
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Valida se o objetivo foi completado e a quantidade de vezes
	if GlobalVar.casas == GlobalVar.obj_casas and GlobalVar.c_obj_casas[0] != true:
		GlobalVar.c_obj_casas = [true, GlobalVar.sprint]
	elif GlobalVar.casas == GlobalVar.obj_casas and GlobalVar.c_obj_casas[0] == true:
		GlobalVar.r_obj_casas += 1

func _on_BtnMuro_pressed():
	# 4 Pedras + 2 Madeiras + 2 Energias
	if GlobalVar.energia >= 2 and GlobalVar.madeira >= 2 and GlobalVar.pedra >= 4 and GlobalVar.conhecimento >= 1:
		GlobalVar.madeira -= 2
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		GlobalVar.pedra -= 4
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		GlobalVar.muros += 1
		$Menu_lateral/Construcoes/Muros.text = 'Muros: ' + str(GlobalVar.muros)
		reduzir_energia(2)
	# Disable automático
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila1/BtnCasa.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnCasa.disabled = true
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnCasa.disabled = false
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila1/BtnMuro.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnMuro.disabled = true
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnMuro.disabled = false
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila1/BtnTorre.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnTorre.disabled = true
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnTorre.disabled = false
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila1/BtnFazenda.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnFazenda.disabled = true
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnFazenda.disabled = false
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Valida se o objetivo foi completado e a quantidade de vezes
	if GlobalVar.muros == GlobalVar.obj_muros and GlobalVar.c_obj_muros[0] != true:
		GlobalVar.c_obj_muros = [true, GlobalVar.sprint]
	elif GlobalVar.muros == GlobalVar.obj_muros and GlobalVar.c_obj_muros[0] == true:
		GlobalVar.r_obj_muros += 1

func _on_BtnTorre_pressed():
	# 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias
	if GlobalVar.energia >= 6 and GlobalVar.madeira >= 6 and GlobalVar.pedra >= 12 and GlobalVar.vidro >= 5 and GlobalVar.conhecimento >= 3:
		GlobalVar.madeira -= 6
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		GlobalVar.pedra -= 12
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		GlobalVar.vidro -= 5
		$Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
		$Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		GlobalVar.torres += 1
		$Menu_lateral/Construcoes/Torres.text = 'Torres: ' + str(GlobalVar.torres)
		reduzir_energia(6)
	# Disable automático
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila1/BtnCasa.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnCasa.disabled = true
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnCasa.disabled = false
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila1/BtnMuro.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnMuro.disabled = true
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnMuro.disabled = false
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila1/BtnTorre.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnTorre.disabled = true
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnTorre.disabled = false
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila1/BtnFazenda.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnFazenda.disabled = true
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnFazenda.disabled = false
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Valida se o objetivo foi completado e a quantidade de vezes
	if GlobalVar.torres == GlobalVar.obj_torres and GlobalVar.c_obj_torres[0] != true:
		GlobalVar.c_obj_torres = [true, GlobalVar.sprint]
	elif GlobalVar.torres == GlobalVar.obj_torres and GlobalVar.c_obj_torres[0] == true:
		GlobalVar.r_obj_torres += 1

func _on_BtnFazenda_pressed():
	# 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias
	if GlobalVar.energia >= 6 and GlobalVar.madeira >= 12 and GlobalVar.pedra >= 4 and GlobalVar.vidro >= 4 and GlobalVar.conhecimento >= 4:
		GlobalVar.madeira -= 10
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		GlobalVar.pedra -= 4
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		GlobalVar.vidro -= 4
		$Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
		$Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		GlobalVar.fazendas += 1
		$Menu_lateral/Construcoes/Fazendas.text = 'Fazendas: ' + str(GlobalVar.fazendas)
		reduzir_energia(6)
	# Disable automático
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila1/BtnCasa.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnCasa.disabled = true
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnCasa.disabled = false
		$PopVila1/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila1/BtnMuro.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnMuro.disabled = true
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnMuro.disabled = false
		$PopVila1/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila1/BtnTorre.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnTorre.disabled = true
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnTorre.disabled = false
		$PopVila1/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila1/BtnFazenda.hint_tooltip = 'Sem Materiais, Recursos ou Energia suficiente'
		$PopVila1/BtnFazenda.disabled = true
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila1/BtnFazenda.disabled = false
		$PopVila1/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Valida se o objetivo foi completado e a quantidade de vezes
	if GlobalVar.fazendas == GlobalVar.obj_fazendas and GlobalVar.c_obj_fazendas[0] != true:
		GlobalVar.c_obj_fazendas = [true, GlobalVar.sprint]
	elif GlobalVar.fazendas == GlobalVar.obj_fazendas and GlobalVar.c_obj_fazendas[0] == true:
		GlobalVar.r_obj_fazendas += 1

# Botões de Melhorias
func _on_BtnRecursos_pressed():
	# 8 Moedas + 4 Energias
	if GlobalVar.energia >= 4 and GlobalVar.moeda >= 8:
		var ma = int(r.randf_range(1, 3.1))
		var pe = int(r.randf_range(1, 3.1))
		var ar = int(r.randf_range(1, 3.1))
		var mi = int(r.randf_range(1, 3.1))
		var ca = int(r.randf_range(1, 3.1))
		# Madeira
		GlobalVar.a_limite_madeira += ma
		GlobalVar.limite_madeira += ma
		$Menu_lateral/Recursos/MadeiraBar.max_value = GlobalVar.limite_madeira
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		# Pedra
		GlobalVar.a_limite_pedra += pe
		GlobalVar.limite_pedra += pe
		$Menu_lateral/Recursos/PedraBar.max_value = GlobalVar.limite_pedra
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		# Areia
		GlobalVar.a_limite_areia += ar
		GlobalVar.limite_areia += ar
		$Menu_lateral/Recursos/AreiaBar.max_value = GlobalVar.limite_areia
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		# Minerais
		GlobalVar.a_limite_minerais += mi
		GlobalVar.limite_minerais += mi
		$Menu_lateral/Recursos/MineraisBar.max_value = GlobalVar.limite_minerais
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		# Carvão
		GlobalVar.a_limite_carvao += ca
		GlobalVar.limite_carvao += ca
		$Menu_lateral/Recursos/CarvaoBar.max_value = GlobalVar.limite_carvao
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		# Rduz moedas
		GlobalVar.moeda -= 8
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		reduzir_energia(4)
	# Disable automático
	if GlobalVar.energia < 4 or GlobalVar.moeda < 8:
		$PopVila2/BtnRecursos.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnRecursos.disabled = true
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnRecursos.disabled = false
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.moeda < 4:
		$PopVila2/BtnMateriais.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnMateriais.disabled = true
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnMateriais.disabled = false
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 * GlobalVar.conhecimento or GlobalVar.moeda < 3 * GlobalVar.conhecimento or GlobalVar.conhecimento == 4:
		if GlobalVar.conhecimento < 4:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		else:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Conhecimento máximo alcançado'
		$PopVila2/BtnConhecimento.disabled = true
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnConhecimento.disabled = false
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnMateriais_pressed():
	# 4 Moedas + 2 Energias
	if GlobalVar.energia >= 2 and GlobalVar.moeda >= 4:
		var vi = int(r.randf_range(1, 3.1))
		var mo = int(r.randf_range(1, 3.1))
		# Vidro
		GlobalVar.a_limite_vidro += vi
		GlobalVar.limite_vidro += vi
		$Menu_lateral/Materiais/VidroBar.max_value = GlobalVar.limite_vidro
		$Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		$Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
		# Moeda
		GlobalVar.a_limite_moeda += mo
		GlobalVar.limite_moeda += mo
		$Menu_lateral/Materiais/MoedaBar.max_value = GlobalVar.limite_moeda
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		GlobalVar.moeda -= 4
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		reduzir_energia(2)
	# Disable automático
	if GlobalVar.energia < 4 or GlobalVar.moeda < 8:
		$PopVila2/BtnRecursos.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnRecursos.disabled = true
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnRecursos.disabled = false
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.moeda < 4:
		$PopVila2/BtnMateriais.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnMateriais.disabled = true
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnMateriais.disabled = false
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 * GlobalVar.conhecimento or GlobalVar.moeda < 3 * GlobalVar.conhecimento or GlobalVar.conhecimento == 4:
		if GlobalVar.conhecimento < 4:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		else:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Conhecimento máximo alcançado'
		$PopVila2/BtnConhecimento.disabled = true
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnConhecimento.disabled = false
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnConhecimento_pressed():
	# 3 * nivel Moedas + 2 * nivel Energias
	if GlobalVar.energia >= 2 * GlobalVar.conhecimento and GlobalVar.moeda >= 3 * GlobalVar.conhecimento and GlobalVar.conhecimento < 4:
		GlobalVar.moeda -= 3 * GlobalVar.conhecimento
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		reduzir_energia(2 * GlobalVar.conhecimento)
		GlobalVar.conhecimento += 1
		$Menu_lateral/Conhecimento/Nivel.text = 'Nível: ' + str(GlobalVar.conhecimento)
		# Transformador automático
		if GlobalVar.conhecimento <= 3:
			if GlobalVar.conhecimento == 1:
				$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento I'
			elif GlobalVar.conhecimento == 2:
				$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento II'
			elif GlobalVar.conhecimento == 3:
				$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento III'
			$PopVila2/BtnConhecimento/DetalheText.text = 'Adquira conhecimento e desbloqueie:\n\nConhecimento II - Casa\nConhecimento III - Torre\nConhecimento IV - Fazenda\n\nCusto:\n'+ str(3 * GlobalVar.conhecimento) + ' Moedas\n' + str(2 * GlobalVar.conhecimento) + ' Energias'
		else:
			$PopVila2/BtnConhecimento/ItemText.text = 'Conhcimento IV'
			$PopVila2/BtnConhecimento/DetalheText.text = 'Adquira conhecimento e desbloqueie:\n\nConhecimento II - Casa\nConhecimento III - Torre\nConhecimento IV - Fazenda\n\nCusto:\nNão há mais nada para aprender'
	# Disable automático
	if GlobalVar.energia < 4 or GlobalVar.moeda < 8:
		$PopVila2/BtnRecursos.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnRecursos.disabled = true
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnRecursos.disabled = false
		$PopVila2/BtnRecursos.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 or GlobalVar.moeda < 4:
		$PopVila2/BtnMateriais.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		$PopVila2/BtnMateriais.disabled = true
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnMateriais.disabled = false
		$PopVila2/BtnMateriais.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 2 * GlobalVar.conhecimento or GlobalVar.moeda < 3 * GlobalVar.conhecimento or GlobalVar.conhecimento == 4:
		if GlobalVar.conhecimento < 4:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Sem Moedas ou Energia suficiente'
		else:
			$PopVila2/BtnConhecimento.hint_tooltip = 'Conhecimento máximo alcançado'
		$PopVila2/BtnConhecimento.disabled = true
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila2/BtnConhecimento.disabled = false
		$PopVila2/BtnConhecimento.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

# Botões de Materiais
func _on_BtnVidro_pressed():
	# 5 Areias + 2 Carvões + 2 Energias
	if GlobalVar.energia >= 2 and GlobalVar.areia >= 5 and GlobalVar.carvao >= 2 and GlobalVar.vidro < GlobalVar.limite_vidro:
		GlobalVar.areia -= 5
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		GlobalVar.carvao -= 2
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		GlobalVar.t_vidro += 1
		GlobalVar.vidro += 1
		$Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
		$Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		reduzir_energia(2)
	# Disable automático
	if GlobalVar.energia < 2 or GlobalVar.areia < 5 or GlobalVar.carvao < 2 or GlobalVar.vidro == GlobalVar.limite_vidro:
		$PopForja/BtnVidro.disabled = true
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnVidro.disabled = false
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 1 or GlobalVar.minerais < 1 or GlobalVar.carvao < 2 or GlobalVar.moeda == GlobalVar.limite_moeda:
		$PopForja/BtnMoeda.disabled = true
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnMoeda.disabled = false
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnMoeda_pressed():
	# 1 Mineral + 2 Carvões + 1 Energia
	if GlobalVar.energia >= 1 and GlobalVar.minerais >= 1 and GlobalVar.carvao >= 2 and GlobalVar.moeda < GlobalVar.limite_moeda:
		GlobalVar.minerais -= 1
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		GlobalVar.carvao -= 2
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		GlobalVar.t_moeda += 1
		GlobalVar.moeda += 1
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		reduzir_energia(1)
	# Disable automático
	if GlobalVar.energia < 2 or GlobalVar.areia < 5 or GlobalVar.carvao < 2 or GlobalVar.vidro == GlobalVar.limite_vidro:
		$PopForja/BtnVidro.disabled = true
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnVidro.disabled = false
		$PopForja/BtnVidro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	if GlobalVar.energia < 1 or GlobalVar.minerais < 1 or GlobalVar.carvao < 2 or GlobalVar.moeda == GlobalVar.limite_moeda:
		$PopForja/BtnMoeda.disabled = true
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnMoeda.disabled = false
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
