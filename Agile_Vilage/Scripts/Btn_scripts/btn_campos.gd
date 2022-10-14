extends Node

var r = RandomNumberGenerator.new()

# Função para deixar os ganhos de maeriasi de forma randômica, replicado para todos os tipo
func randomizar_ganhos() -> int:
	r.randomize()
	return int(r.randf_range(1, 3))

func reduzir_energia(e):
	GlobalVar.energia -= int(e)
	$Menu_lateral/EnergiaBar.value = GlobalVar.energia
	$Menu_lateral/EnergiaBar/Energia.text = str(GlobalVar.energia) + '/' + str(GlobalVar.limite_energia)

# Botões de recursos naturais
func _on_BtnMadeira_pressed():
	if GlobalVar.energia > 0 and GlobalVar.madeira < GlobalVar.limite_madeira:
		GlobalVar.madeira += randomizar_ganhos()
		if GlobalVar.madeira > GlobalVar.limite_madeira:
			GlobalVar.madeira = GlobalVar.limite_madeira
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		reduzir_energia(1)

func _on_BtnPedra_pressed():
	if GlobalVar.energia > 0 and GlobalVar.pedra < GlobalVar.limite_pedra:
		GlobalVar.pedra += randomizar_ganhos()
		if GlobalVar.pedra > GlobalVar.limite_pedra:
			GlobalVar.pedra = GlobalVar.limite_pedra
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		reduzir_energia(1)

func _on_BtnAreia_pressed():
	if GlobalVar.energia > 0 and GlobalVar.areia < GlobalVar.limite_areia:
		GlobalVar.areia += randomizar_ganhos()
		if GlobalVar.areia > GlobalVar.limite_areia:
			GlobalVar.areia = GlobalVar.limite_areia
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		reduzir_energia(1)

func _on_BtnMinerais_pressed():
	if GlobalVar.energia > 0 and GlobalVar.minerais < GlobalVar.limite_minerais:
		GlobalVar.minerais += randomizar_ganhos()
		if GlobalVar.minerais > GlobalVar.limite_minerais:
			GlobalVar.minerais = GlobalVar.limite_minerais
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		reduzir_energia(1)

func _on_BtnCarvao_pressed():
	if GlobalVar.energia > 0 and GlobalVar.carvao < GlobalVar.limite_carvao:
		GlobalVar.carvao += randomizar_ganhos()
		if GlobalVar.carvao > GlobalVar.limite_carvao:
			GlobalVar.carvao = GlobalVar.limite_carvao
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		reduzir_energia(1)

# Botões de Pop Up
func _on_BtnVila_pressed():
	$PopVila.popup_centered()
	# Casa = 8 Madeiras + 4 vidros + 5 Pedras + 5 Energias
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila/BtnCasa.disabled = true
		$PopVila/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnCasa.disabled = false
		$PopVila/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Muro = 4 Pedras + 2 Madeiras + 2 Energias
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila/BtnMuro.disabled = true
		$PopVila/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnMuro.disabled = false
		$PopVila/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Torre = 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila/BtnTorre.disabled = true
		$PopVila/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnTorre.disabled = false
		$PopVila/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Fazenda = 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila/BtnFazenda.disabled = true
		$PopVila/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnFazenda.disabled = false
		$PopVila/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

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
	if GlobalVar.energia >= 5 and GlobalVar.madeira >= 8 and GlobalVar.pedra >= 5 and GlobalVar.vidro >= 4:
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
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila/BtnCasa.disabled = true
	else:
		$PopVila/BtnCasa.disabled = false
	# Disable automático
	if GlobalVar.energia < 5 or GlobalVar.madeira < 8 or GlobalVar.pedra < 5 or GlobalVar.vidro < 4:
		$PopVila/BtnCasa.disabled = true
		$PopVila/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnCasa.disabled = false
		$PopVila/BtnCasa.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnMuro_pressed():
	# 4 Pedras + 2 Madeiras + 2 Energias
	if GlobalVar.energia >= 2 and GlobalVar.madeira >= 2 and GlobalVar.pedra >= 4:
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
	if GlobalVar.energia < 2 or GlobalVar.madeira < 2 or GlobalVar.pedra < 4:
		$PopVila/BtnMuro.disabled = true
		$PopVila/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnMuro.disabled = false
		$PopVila/BtnMuro.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnTorre_pressed():
	# 12 Pedras + 6 Madeiras + 5 Vidros + 6 Energias
	if GlobalVar.energia >= 6 and GlobalVar.madeira >= 6 and GlobalVar.pedra >= 12 and GlobalVar.vidro >= 5:
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
	if GlobalVar.energia < 6 or GlobalVar.madeira < 6 or GlobalVar.pedra < 12 or GlobalVar.vidro < 5:
		$PopVila/BtnTorre.disabled = true
		$PopVila/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnTorre.disabled = false
		$PopVila/BtnTorre.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

func _on_BtnFazenda_pressed():
	# 12 Madeiras + 4 Vidros + 4 Pedras + 6 Energias
	if GlobalVar.energia >= 6 and GlobalVar.madeira >= 12 and GlobalVar.pedra >= 4 and GlobalVar.vidro >= 4:
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
	if GlobalVar.energia < 6 or GlobalVar.madeira < 12 or GlobalVar.pedra < 4 or GlobalVar.vidro < 4:
		$PopVila/BtnFazenda.disabled = true
		$PopVila/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopVila/BtnFazenda.disabled = false
		$PopVila/BtnFazenda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

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

func _on_BtnMoeda_pressed():
	# 1 Mineral + 2 Carvões + 1 Energia
	if GlobalVar.energia >= 1 and GlobalVar.minerais >= 1 and GlobalVar.carvao >= 2 and GlobalVar.moeda < GlobalVar.limite_moeda:
		GlobalVar.minerais -= 1
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		GlobalVar.carvao -= 2
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		GlobalVar.moeda += 1
		$Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		reduzir_energia(1)
	# Disable automático
	if GlobalVar.energia < 1 or GlobalVar.minerais < 1 or GlobalVar.carvao < 2 or GlobalVar.moeda == GlobalVar.limite_moeda:
		$PopForja/BtnMoeda.disabled = true
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	else:
		$PopForja/BtnMoeda.disabled = false
		$PopForja/BtnMoeda.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
