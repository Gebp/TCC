extends Node2D

var r = RandomNumberGenerator.new()
# Probabilidade de um evento bo ocorrer
var re_b = RandomNumberGenerator.new()
# probabilidade de um evento ruim ocorrer
var re_o = RandomNumberGenerator.new()
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
	if GlobalVar.sprint >= 1 and GlobalVar.sprint < 3:
		return int(r.randf_range(1, 50))
	elif GlobalVar.sprint >= 3 and GlobalVar.sprint < 6:
		return int(r.randf_range(1, 75))
	elif GlobalVar.sprint >= 6 and GlobalVar.sprint < 11:
		return int(r.randf_range(1, 100))
	else:
		return int(r.randf_range(1, 500))

func energia_random():
	re_e.randomize()
	return int(re_e.randf_range(1, 5))

# Função dos eventos aleatórios
func eventos():
	re_o = prob_random()
	# eventos negativos
	if re_o >= 45:
		GlobalVar.limite_energia -= energia_random()
		if GlobalVar.limite_energia <= 0:
			GlobalVar.limite_energia = 1
	
	re_b = prob_random()
	# eventos positivos
	if re_b >= 45:
		GlobalVar.limite_energia += energia_random()

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
	$Campos/PopVila.popup_centered()

func _on_Popup8_popup_hide():
	$Tutorial/Popup9.popup()
	$Campos/PopVila.hide()
	$Encerrar.visible = true

func _on_Popup9_popup_hide():
	$Encerrar.visible = false
	$Tutorial/Popup10.popup()

func _on_Popup10_popup_hide():
	$Campos/Menu_lateral/T_exec.start()
# -----------------------

func _on_Sprint_mouse_entered():
	$Campos/Menu_lateral/Sprint.hint_tooltip = 'Sprint atual do Projeto: ' + str(GlobalVar.sprint) + '\nSprints previstas para o Projeto: ' + str(GlobalVar.qtd_sprint) + '\nSprints restantes para conclusão do Projeto: ' + str(GlobalVar.qtd_sprint - GlobalVar.sprint)

func _on_Dia_mouse_entered():
	$Campos/Menu_lateral/Dia.hint_tooltip = 'Dia ' + str(GlobalVar.dia) + ' de 4'

func _on_Encerrar_pressed():
	get_tree().change_scene("res://Telas/5-Resultado.tscn")
