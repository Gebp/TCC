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
		var op = r.randi_range(1, 28)
		a.randomize()
		var red = 0
		if op < 16:
			red = a.randi_range(1, 5)
		else:
			red = a.randi_range(1, 53
		# 1. Destruir Madeira
		if GlobalVar.madeira > 0 and op == 2:
			$Eventos/PopOnus.popup()
		# 2. Destruir Pedra
		if GlobalVar.pedra > 0 and op == 4:
			$Eventos/PopOnus.popup()
		# 3. Destruir Areia
		if GlobalVar.areia > 0 and op == 6:
			$Eventos/PopOnus.popup()
		# 4. Destruir Carvão
		if GlobalVar.carvao > 0 and op == 8:
			$Eventos/PopOnus.popup()
		# 5. Destruir Minerais
		if GlobalVar.minerais > 0 and op == 10:
			$Eventos/PopOnus.popup()
		# 6. Destruir Vidro
		if GlobalVar.vidro > 0 and op == 12:
			$Eventos/PopOnus.popup()
		# 7. Destruir Moeda
		if GlobalVar.moeda > 0 and op == 14:
			$Eventos/PopOnus.popup()
		# 8. Destruir Casa
		if GlobalVar.casas > 0 and op == 16:
			$Eventos/PopOnus.popup()
		# 9. Destruir Muro
		if GlobalVar.muros > 0 and op == 18:
			$Eventos/PopOnus.popup()
		# 10. Destruir Torre
		if GlobalVar.torres > 0 and op == 20:
			$Eventos/PopOnus.popup()
		# 12. Destruir Fazenda
		if GlobalVar.fazendas > 0 and op == 22:
			$Eventos/PopOnus.popup()
	
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
		var op = r.randi_range(1, 14)
		a.randomize()
		var red = a.randi_range(1, 5)
		# 1. Vender Madeira
		if op == 2:
			
			$Eventos/PopBonus/DetalheText.text = ''
			$Eventos/PopBonus.popup()
		# 2. Vender Pedra
		if op == 4:
			$Eventos/PopBonus.popup()
		# 3. Vender Areia
		if op == 6:
			$Eventos/PopBonus.popup()
		# 4. Vender Carvao
		if op == 8:
			$Eventos/PopBonus.popup()
		# 5. Vender Minerais
		if op == 10:
			$Eventos/PopBonus.popup()
		# 6. Vender Vidro
		if op == 12:
			$Eventos/PopBonus.popup()

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
