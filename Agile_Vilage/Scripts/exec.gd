extends Node2D

var r = RandomNumberGenerator.new()
var a = RandomNumberGenerator.new()
# Probabilidade de um evento bo ocorrer
var re_mb = RandomNumberGenerator.new() # micro evento
var re_i = RandomNumberGenerator.new() # evento inevitável
# probabilidade de um evento ruim ocorrer
var re_mo = RandomNumberGenerator.new() # microevento
var re_s = RandomNumberGenerator.new() # evento selecionável
# nivel de alteração da energia
var re_e = RandomNumberGenerator.new()
# Valores para os eventos de compra
var aqu = 0 # aquisiçao
var pag = 0 # pagamento
var be = 0

func _ready():
	if GlobalVar.sprint == 0:
		$Encerrar.visible = false
		$Encerrar.disabled = true
	else:
		$Encerrar.visible = true
		$Encerrar.disabled = false
	if GlobalVar.tutorial and GlobalVar.sprint == 0 and GlobalVar.dia == 1:
		$Campos/Menu_lateral/T_exec.stop()
		$Tutorial/Popup0.popup_centered()
	# Condição para a sprint 0 ser a mais ideal possível
	if GlobalVar.sprint > 0:
		eventos()

# Conforme a aquantidade de sprint
# a probabilidade de um evento aleatório ocorrer será maior
func prob_random():
	r.randomize()
	return int(r.randf_range(1, abs(int(GlobalVar.sprint*2)-int(GlobalVar.dia))+1))

func energia_random():
	re_e.randomize()
	return int(re_e.randf_range(1, 5))

# Função dos eventos aleatórios
func eventos():
	re_mo = prob_random()
	re_i = prob_random()
	# eventos negativos
	if re_mo >= abs(int(GlobalVar.sprint)-int(GlobalVar.dia)):
		GlobalVar.micro_eventos += 1
		var red_energia = energia_random()
		var limite_anterior = GlobalVar.limite_energia
		GlobalVar.limite_energia -= red_energia
		if GlobalVar.limite_energia <= 5:
			var dif = 1 - limite_anterior
			GlobalVar.limite_energia = 6
			GlobalVar.onus_energia += abs(dif)
		else:
			GlobalVar.onus_energia += red_energia
	
	if GlobalVar.sprint >= 3 and re_i >= abs(int(GlobalVar.sprint)-int(GlobalVar.dia)) and GlobalVar.dia == 1 or GlobalVar.dia == 4:
		r.randomize()
		var oe = r.randi_range(1, 28)
		a.randomize()
		var red = 0
		if oe < 16:
			red = a.randi_range(1, 5)
		else:
			red = a.randi_range(1, 3)
		# 1. Destruir Madeira
		if GlobalVar.madeira > 0 and oe == 2:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.madeira -= red
			if GlobalVar.madeira < 0:
				red -= GlobalVar.madeira
				GlobalVar.madeira = 0
			$Eventos/PopOnus/DetalheText.text = 'Um incêndio começou e atingiu seu depósito de Madeira. ' + str(red) + ' Madeira/s perdida/s.'
			$Campos/Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
			$Campos/Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
			GlobalVar.o_madeira += red
		# 2. Destruir Pedra
		elif GlobalVar.pedra > 0 and oe == 4:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.pedra -= red
			if GlobalVar.pedra < 0:
				red -= GlobalVar.pedra
				GlobalVar.pedra = 0
			$Eventos/PopOnus/DetalheText.text = 'Um incêndio começou e atingiu seu depósito de Pedra. ' + str(red) + ' Pedra/s perdida/s.'
			$Campos/Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
			$Campos/Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
			GlobalVar.o_pedra += red
		# 3. Destruir Areia
		elif GlobalVar.areia > 0 and oe == 6:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.areia -= red
			if GlobalVar.areia < 0:
				red -= GlobalVar.areia
				GlobalVar.areia = 0
			$Eventos/PopOnus/DetalheText.text = 'Um furacão atingiu o vilarejo e destruiui parte do seu depósito de Areia. ' + str(red) + ' Areia/s perdida/s.'
			$Campos/Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
			$Campos/Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
			GlobalVar.o_areia += red
		# 4. Destruir Carvão
		elif GlobalVar.carvao > 0 and oe == 8:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.carvao -= red
			if GlobalVar.carvao < 0:
				red -= GlobalVar.carvao
				GlobalVar.carvao = 0
			$Eventos/PopOnus/DetalheText.text = 'Um incêndio começou e atingiu seu depósito de Carvão. ' + str(red) + ' Carvão/ões perdido/s.'
			$Campos/Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
			$Campos/Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
			GlobalVar.o_carvao += red
		# 5. Destruir Minerais
		elif GlobalVar.minerais > 0 and oe == 10:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.minerais -= red
			if GlobalVar.minerais < 0:
				red -= GlobalVar.minerais
				GlobalVar.minerais = 0
			$Eventos/PopOnus/DetalheText.text = 'Um incêndio começou e atingiu seu depósito de Minérais. ' + str(red) + ' Mineral/is perdido/s.'
			$Campos/Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
			$Campos/Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
			GlobalVar.o_minerais += red
		# 6. Destruir Vidro
		elif GlobalVar.vidro > 0 and oe == 12:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.vidro -= red
			if GlobalVar.vidro < 0:
				red -= GlobalVar.vidro
				GlobalVar.vidro = 0
			$Eventos/PopOnus/DetalheText.text = 'Um terremoto fraco atingiu o vilarejo e seu depósito de Vidro foi atingido. ' + str(red) + ' Vidro/s perdido/s.'
			$Campos/Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
			$Campos/Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
			GlobalVar.o_vidro += red
		# 7. Destruir Moeda
		elif GlobalVar.moeda > 0 and oe == 14:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.moeda -= red
			if GlobalVar.moeda < 0:
				red -= GlobalVar.moeda
				GlobalVar.moeda = 0
			$Eventos/PopOnus/DetalheText.text = 'Um furacão atingiu o vilarejo e destruiui parte do seu depósito de Moedas. ' + str(red) + ' Moeda/s perdida/s.'
			$Campos/Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
			$Campos/Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
			GlobalVar.o_moeda += red
		# 8. Destruir Casa
		elif GlobalVar.casas > 0 and oe == 16:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.casas -= red
			if GlobalVar.casas < 0:
				red -= GlobalVar.casas
				GlobalVar.casas = 0
			$Eventos/PopOnus/DetalheText.text = 'Um terremoto mediano atingiu o vilarejo e derrubou algumas Casaa. ' + str(red) + ' Casa/s perdida/s.'
			$Campos/Menu_lateral/Construcoes/Casas.text = 'Casas: ' + str(GlobalVar.casas)
			GlobalVar.o_casas += red
		# 9. Destruir Muro
		elif GlobalVar.muros > 0 and oe == 18:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.muros -= red
			if GlobalVar.muros < 0:
				red -= GlobalVar.muros
				GlobalVar.muros = 0
			$Eventos/PopOnus/DetalheText.text = 'Um furacão atingiu o vilarejo e destruiui parte do seus Muros. ' + str(red) + ' Muro/s perdido/s.'
			$Campos/Menu_lateral/Construcoes/Muros.text = 'Muros: ' + str(GlobalVar.muros)
			GlobalVar.o_muros += red
		# 10. Destruir Torre
		elif GlobalVar.torres > 0 and oe == 20:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.torres -= red
			if GlobalVar.torres < 0:
				red -= GlobalVar.torres
				GlobalVar.torres = 0
			$Eventos/PopOnus/DetalheText.text = 'Um terremoto forte atingiu o vilarejo e derrubou algumas Torres. ' + str(red) + ' Torre/s perdida/s.'
			$Campos/Menu_lateral/Construcoes/Torres.text = 'Torres: ' + str(GlobalVar.torres)
			GlobalVar.o_torres += red
		# 12. Destruir Fazenda
		elif GlobalVar.fazendas > 0 and oe == 22:
			GlobalVar.eventos_inevitaveis += 1
			$Eventos/PopOnus.popup()
			GlobalVar.fazendas -= red
			if GlobalVar.fazendas < 0:
				red -= GlobalVar.fazendas
				GlobalVar.fazendas = 0
			$Eventos/PopOnus/DetalheText.text = 'Um incêndio começou e algumas Fazendas. ' + str(red) + ' Fazenda/s perdida/s.'
			$Campos/Menu_lateral/Construcoes/Fazendas.text = 'Fazendas: ' + str(GlobalVar.fazendas)
			GlobalVar.o_fazendas += red
	
	re_mb = prob_random()
	re_s = prob_random()
	# eventos positivos
	if re_mb >= abs(int(GlobalVar.sprint)-int(GlobalVar.dia)):
		GlobalVar.micro_eventos += 1
		var add_energia = energia_random()
		GlobalVar.limite_energia += add_energia
		GlobalVar.bonus_energia += add_energia
	
	if GlobalVar.sprint >= 3 and re_s >= abs(int(GlobalVar.sprint)-int(GlobalVar.dia)) and GlobalVar.dia == 1 or GlobalVar.dia == 4:
		r.randomize()
		be = r.randi_range(1, 14)
		a.randomize()
		aqu = a.randi_range(2, 10)
		pag = a.randi_range(3, 12) # em moedas
		# 1. Vender Madeira
		if be == 2:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Madeiras por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		# 2. Vender Pedra
		elif be == 4:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Pedras por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		# 3. Vender Areia
		elif be == 6:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Areias por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		# 4. Vender Carvao
		elif be == 8:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Carvões por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		# 5. Vender Minerais
		elif be == 10:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Minerais por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		# 6. Vender Vidro
		elif be == 12:
			GlobalVar.eventos_selecionaveis += 1
			$Eventos/PopBonus/DetalheText.text = 'O Mercador está oferecendo ' + str(aqu) + ' Vidros por ' + str(pag) + ' Moedas.'
			$Eventos/PopBonus.popup()
		if GlobalVar.moeda - pag >= 0:
			$Eventos/PopBonus/BtnConfirma.disabled = false
			$Eventos/PopBonus/BtnConfirma.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		else:
			$Eventos/PopBonus/BtnConfirma.hint_tooltip = 'Sem Moedas suficientes'
			$Eventos/PopBonus/BtnConfirma.disabled = true
			$Eventos/PopBonus/BtnConfirma.mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN

func _on_BtnConfirma_pressed():
	if GlobalVar.moeda - pag >= 0:
		# 1. Vender Madeira
		if be == 2:
			GlobalVar.madeira += aqu
			if GlobalVar.madeira > GlobalVar.limite_madeira:
				GlobalVar.madeira = GlobalVar.limite_madeira
			$Campos/Menu_lateral/Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
			$Campos/Menu_lateral/Recursos/MadeiraBar.value = GlobalVar.madeira
		# 2. Vender Pedra
		elif be == 4:
			GlobalVar.pedra += aqu
			if GlobalVar.pedra > GlobalVar.limite_pedra:
				GlobalVar.pedra = GlobalVar.limite_pedra
			$Campos/Menu_lateral/Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
			$Campos/Menu_lateral/Recursos/PedraBar.value = GlobalVar.pedra
		# 3. Vender Areia
		elif be == 6:
			GlobalVar.areia += aqu
			if GlobalVar.areia > GlobalVar.limite_areia:
				GlobalVar.areia = GlobalVar.limite_areia
			$Campos/Menu_lateral/Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
			$Campos/Menu_lateral/Recursos/AreiaBar.value = GlobalVar.areia
		# 4. Vender Carvao
		elif be == 8:
			GlobalVar.carvao += aqu
			if GlobalVar.carvao > GlobalVar.limite_carvao:
				GlobalVar.carvao = GlobalVar.limite_carvao
			$Campos/Menu_lateral/Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
			$Campos/Menu_lateral/Recursos/CarvaoBar.value = GlobalVar.carvao
		# 5. Vender Minerais
		elif be == 10:
			GlobalVar.minerais += aqu
			if GlobalVar.minerais > GlobalVar.limite_minerais:
				GlobalVar.minerais = GlobalVar.limite_minerais
			$Campos/Menu_lateral/Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
			$Campos/Menu_lateral/Recursos/MineraisBar.value = GlobalVar.minerais
		# 6. Vender Vidro
		elif be == 12:
			GlobalVar.vidro += aqu
			if GlobalVar.vidro > GlobalVar.limite_vidro:
				GlobalVar.vidro = GlobalVar.limite_vidro
			$Campos/Menu_lateral/Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
			$Campos/Menu_lateral/Materiais/VidroBar.value = GlobalVar.vidro
		GlobalVar.ofertas_aceitas += 1
		GlobalVar.b_moeda += pag
		GlobalVar.moeda -= pag
		$Campos/Menu_lateral/Materiais/MoedaBar/Moeda.text = str(GlobalVar.moeda) + '/' + str(GlobalVar.limite_moeda)
		$Campos/Menu_lateral/Materiais/MoedaBar.value = GlobalVar.moeda
		$Eventos/PopBonus.hide()

func _on_BtnRecusa_pressed():
	$Eventos/PopBonus.hide()

# Passagem dos tutoriais
# -----------------------
func _on_Popup0_popup_hide():
	$Tutorial/Popup1.popup()

func _on_Popup1_popup_hide():
	$Tutorial/Popup2.popup()

func _on_Popup2_popup_hide():
	$Tutorial/Popup3.popup()

func _on_Popup3_popup_hide():
	$Tutorial/Popup4.popup()
	$Campos/Menu_lateral/PopObj.popup_centered()

func _on_Popup4_popup_hide():
	$Tutorial/Popup5.popup()
	$Campos/Menu_lateral/PopObj.hide()

func _on_Popup5_popup_hide():
	$Tutorial/Popup6.popup()
	$Campos/PopForja.popup_centered()

func _on_Popup6_popup_hide():
	$Tutorial/Popup7.popup()
	$Campos/PopForja.hide()

func _on_Popup7_popup_hide():
	$Tutorial/Popup8.popup()
	$Campos/PopVila1.popup_centered()

func _on_Popup8_popup_hide():
	$Tutorial/Popup9.popup()
	$Campos/PopVila1.hide()
	$Campos/PopVila2.popup_centered()

func _on_Popup9_popup_hide():
	$Encerrar.visible = true
	$Tutorial/Popup10.popup()
	$Campos/PopVila2.hide()

func _on_Popup10_popup_hide():
	$Encerrar.visible = false
	$Tutorial/Popup11.popup()

func _on_Popup11_popup_hide():
	$Campos/Menu_lateral/T_exec.start()
# -----------------------

func _on_Sprint_mouse_entered():
	$Campos/Menu_lateral/Sprint.hint_tooltip = 'Sprint atual do Projeto: ' + str(GlobalVar.sprint) + '\nSprints previstas para o Projeto: ' + str(GlobalVar.qtd_sprint) + '\nSprints restantes para conclusão do Projeto: ' + str(GlobalVar.qtd_sprint - GlobalVar.sprint)

func _on_Dia_mouse_entered():
	$Campos/Menu_lateral/Dia.hint_tooltip = 'Dia ' + str(GlobalVar.dia) + ' de 4'

func _on_Encerrar_pressed():
	if GlobalVar.dia < 4:
		GlobalVar.sprint -= 1
		get_tree().change_scene("res://Telas/5-Resultado.tscn")
	else:
		get_tree().change_scene("res://Telas/5-Resultado.tscn")
