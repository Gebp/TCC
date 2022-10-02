extends Node

var tempo = 30

func _ready():
	$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
	$Dia.text = 'Dia: ' + str(GlobalVar.dia)
	GlobalVar.energia = GlobalVar.limite_energia
	$EnergiaBar/Energia.text = str(GlobalVar.energia) + '/' + str(GlobalVar.limite_energia)
	# Set valores iniciais e limites para recursos
	$Recursos/MadeiraBar/Madeira.text = str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
	$Recursos/PedraBar/Pedra.text = str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
	$Recursos/AreiaBar/Areia.text = str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
	$Recursos/MineraisBar/Minerais.text = str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
	$Recursos/CarvaoBar/Carvao.text = str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
	# Set progressão para recursos
	$Recursos/MadeiraBar.max_value = GlobalVar.limite_madeira
	$Recursos/MadeiraBar.value = GlobalVar.madeira
	$Recursos/PedraBar.max_value = GlobalVar.limite_pedra
	$Recursos/PedraBar.value = GlobalVar.pedra
	$Recursos/AreiaBar.max_value = GlobalVar.limite_areia
	$Recursos/AreiaBar.value = GlobalVar.areia
	$Recursos/MineraisBar.max_value = GlobalVar.limite_minerais
	$Recursos/MineraisBar.value = GlobalVar.minerais
	$Recursos/CarvaoBar.max_value = GlobalVar.limite_carvao
	$Recursos/CarvaoBar.value = GlobalVar.carvao
	# Set valores iniciais e limites para materiais
	$Materiais/VidroBar/Vidro.text = str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
	# Set progressão para materiais
	$Materiais/VidroBar.max_value = GlobalVar.limite_madeira
	$Materiais/VidroBar.value = GlobalVar.madeira
	# Set valores iniciais e objetivos
	valida_objetivos()
	$EnergiaBar.max_value = GlobalVar.limite_energia
	$EnergiaBar.value = GlobalVar.limite_energia

func valida_objetivos():
	# Qtd de casas
	$Construcoes/Casas.text = 'Casas: ' + str(GlobalVar.casas)
	$PopObj/Casa_progress.max_value = GlobalVar.obj_casas
	$PopObj/Casa_progress.value = GlobalVar.casas
	$PopObj/Casa_obj.text = 'Construa ' + str(GlobalVar.obj_casas) + ' casas'
	if GlobalVar.casas >= GlobalVar.obj_casas:
		$PopObj/Casa_progress/Label.text = 'Concluído'
	else:
		$PopObj/Casa_progress/Label.text = str(GlobalVar.casas) + '/' + str(GlobalVar.obj_casas)
	# Qtd de torres
	$Construcoes/Torres.text = 'Torres: ' + str(GlobalVar.torres)
	if GlobalVar.obj_torres > 0:
		$PopObj/Torre_obj.visible = true
		$PopObj/Torre_progress.visible = true
		$PopObj/Torre_progress.max_value = GlobalVar.obj_torres
		$PopObj/Torre_progress.value = GlobalVar.torres
		$PopObj/Torre_obj.text = 'Construa ' + str(GlobalVar.obj_torres) + ' torres'
		if GlobalVar.torres >= GlobalVar.obj_torres:
			$PopObj/Torre_progress/Label.text = 'Concluído'
		else:
			$PopObj/Torre_progress/Label.text = str(GlobalVar.torres) + '/' + str(GlobalVar.obj_torres)
	else:
		$PopObj/Torre_obj.visible = false
		$PopObj/Torre_progress.visible = false
	# Qtd de muros
	$Construcoes/Muros.text = 'Muros: ' + str(GlobalVar.muros)
	if GlobalVar.obj_muros > 0:
		$PopObj/Muro_obj.visible = true
		$PopObj/Muro_progress.visible = true
		$PopObj/Muro_progress.max_value = GlobalVar.obj_muros
		$PopObj/Muro_progress.value = GlobalVar.muros
		$PopObj/Muro_obj.text = 'Construa ' + str(GlobalVar.obj_muros) + ' muros'
		if GlobalVar.muros >= GlobalVar.obj_muros:
			$PopObj/Muro_progress/Label.text = 'Concluído'
		else:
			$PopObj/Muro_progress/Label.text = str(GlobalVar.muros) + '/' + str(GlobalVar.obj_muros)
	else:
		$PopObj/Muro_obj.visible = false
		$PopObj/Muro_progress.visible = false	# Qtd de fazendas
	$Construcoes/Fazendas.text = 'Fazendas: ' + str(GlobalVar.fazendas)
	if GlobalVar.obj_fazendas > 0:
		$PopObj/Fazenda_obj.visible = true
		$PopObj/Fazenda_progress.visible = true
		$PopObj/Fazenda_progress.max_value = GlobalVar.obj_fazendas
		$PopObj/Fazenda_progress.value = GlobalVar.fazendas
		$PopObj/Fazenda_obj.text = 'Construa ' + str(GlobalVar.obj_fazendas) + ' fazendas'
		if GlobalVar.fazendas >= GlobalVar.obj_fazendas:
			$PopObj/Fazenda_progress/Label.text = 'Concluído'
		else:
			$PopObj/Fazenda_progress/Label.text = str(GlobalVar.fazendas) + '/' + str(GlobalVar.obj_fazendas)
	else:
		$PopObj/Fazenda_obj.visible = false
		$PopObj/Fazenda_progress.visible = false
	# tamanho popup conforme objetivos
	if GlobalVar.obj_fazendas == 0: 
		$PopObj.rect_size.y = 170
		if GlobalVar.obj_muros == 0:
			$PopObj.rect_size.y = 135
			if GlobalVar.obj_torres == 0:
				$PopObj.rect_size.y = 105

func _on_T_exec_timeout():
	if tempo > 0:
		tempo -= 1
		$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
	if tempo == 0 and GlobalVar.dia < 4:
		GlobalVar.dia += 1
		get_tree().change_scene("res://Telas/4-Execucao.tscn")
	elif tempo == 0 and GlobalVar.dia == 4:
		GlobalVar.sprint += 1
		if GlobalVar.sprint == GlobalVar.qtd_sprint+1:
			get_tree().change_scene("res://Telas/5-Resultado.tscn")
		else:
			GlobalVar.dia = 1
			get_tree().change_scene("res://Telas/3-Planejamento.tscn")

func _on_Obj_btn_pressed():
	$PopObj.popup_centered()

func _on_Obj_btn_mouse_entered():
	$BotaoProx.position.y -= 10

func _on_Obj_btn_mouse_exited():
	$BotaoProx.position.y += 10
