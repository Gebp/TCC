extends Node

var r = RandomNumberGenerator.new()
var btnType = ['Recurso', 'Construção', 'Forja']

# Função para deixar os ganhos de maeriasi de forma randômica, replicado para todos os tipo
func randomizar_ganhos() -> int:
	r.randomize()
	return int(r.randf_range(1, 3))

func reduzir_energia(tipo):
	if btnType[0] == tipo:
		GlobalVar.energia -= 1
	elif btnType[1] == tipo:
		GlobalVar.energia -= 5
	else:
		GlobalVar.energia -= 2
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
		reduzir_energia(btnType[0])

func _on_BtnPedra_pressed():
	if GlobalVar.energia > 0 and GlobalVar.pedra < GlobalVar.limite_pedra:
		GlobalVar.pedra += randomizar_ganhos()
		if GlobalVar.pedra > GlobalVar.limite_pedra:
			GlobalVar.pedra = GlobalVar.limite_pedra
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		reduzir_energia(btnType[0])

func _on_BtnAreia_pressed():
	if GlobalVar.energia > 0 and GlobalVar.areia < GlobalVar.limite_areia:
		GlobalVar.areia += randomizar_ganhos()
		if GlobalVar.areia > GlobalVar.limite_areia:
			GlobalVar.areia = GlobalVar.limite_areia
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		reduzir_energia(btnType[0])

func _on_BtnMinerais_pressed():
	if GlobalVar.energia > 0 and GlobalVar.minerais < GlobalVar.limite_minerais:
		GlobalVar.minerais += randomizar_ganhos()
		if GlobalVar.minerais > GlobalVar.limite_minerais:
			GlobalVar.minerais = GlobalVar.limite_minerais
		$Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		$Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		reduzir_energia(btnType[0])

func _on_BtnCarvao_pressed():
	if GlobalVar.energia > 0 and GlobalVar.carvao < GlobalVar.limite_carvao:
		GlobalVar.carvao += randomizar_ganhos()
		if GlobalVar.carvao > GlobalVar.limite_carvao:
			GlobalVar.carvao = GlobalVar.limite_carvao
		$Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
		$Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		reduzir_energia(btnType[0])

# Botões de Pop Up
func _on_BtnVila_pressed():
	$PopVila.popup_centered()
	if GlobalVar.energia < 6 or (GlobalVar.madeira < 11 and GlobalVar.pedra < 6 and GlobalVar.vidro < 5):
		$PopVila/BtnCasa.disabled = true
	else:
		$PopVila/BtnCasa.disabled = false

func _on_BtnForja_pressed():
	$PopForja.popup_centered()
	if GlobalVar.energia < 3 or (GlobalVar.areia < 6 and GlobalVar.carvao < 3 and GlobalVar.vidro < GlobalVar.limite_vidro + 1):
		$PopForja/BtnVidro.disabled = true
	else:
		$PopForja/BtnVidro.disabled = false

func valida_objetivos():
	$Menu_lateral/Construcoes/Casas.text = 'Casas: ' + str(GlobalVar.casas)
	$Menu_lateral/PopObj/Casa_progress.max_value = GlobalVar.obj_casas
	$Menu_lateral/PopObj/Casa_progress.value = GlobalVar.casas
	$Menu_lateral/PopObj/Casa_obj.text = 'Construa ' + str(GlobalVar.obj_casas) + 'casas'
	if GlobalVar.casas >= GlobalVar.obj_casas:
		$Menu_lateral/PopObj/Casa_progress/Label.text = 'Concluído'
	else:
		$Menu_lateral/PopObj/Casa_progress/Label.text = str(GlobalVar.casas) + '/' + str(GlobalVar.obj_casas)

# Botões de Construções
func _on_BtnCasa_pressed():
	if GlobalVar.energia >= 5 and GlobalVar.madeira >= 10 and GlobalVar.pedra >= 5 and GlobalVar.vidro >= 4:
		GlobalVar.madeira -= 10
		$Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		$Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		GlobalVar.pedra -= 5
		$Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		$Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		GlobalVar.vidro -= 4
		$Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		$Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		GlobalVar.casas += 1
		valida_objetivos()
		reduzir_energia(btnType[1])

# Botões de Materiais
func _on_BtnVidro_pressed():
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
		reduzir_energia(btnType[2])
