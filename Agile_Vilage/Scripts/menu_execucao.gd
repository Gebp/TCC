extends Node

var tempo = 5

func _ready():
	$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
	$Dia.text = 'Dia: ' + str(GlobalVar.dia)
	GlobalVar.energia = GlobalVar.limite_energia
	$Energia.text = str(GlobalVar.energia) + '/' + str(GlobalVar.limite_energia)
	# Set valores iniciais e limites para recursos
	$Madeira.text = 'Madeira: ' + str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
	$Pedra.text = 'Pedra: ' + str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
	$Areia.text = 'Areia: ' + str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
	$Minerais.text = 'Minerais: ' + str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
	$Carvao.text = 'Carvão: ' + str(GlobalVar.carvao) + '/' + str(GlobalVar.limite_carvao)
	# Set valores iniciais e limites para materiais
	$Vidro.text = 'Vidro: ' + str(GlobalVar.vidro) + '/' + str(GlobalVar.limite_vidro)
	# Set valores iniciais e objetivos
	valida_objetivos()
	$EnergiaBar.max_value = GlobalVar.limite_energia
	$EnergiaBar.value = GlobalVar.limite_energia

func valida_objetivos():
	$Casas.text = 'Casas: ' + str(GlobalVar.casas)
	$PopObj/Casa_progress.max_value = GlobalVar.obj_casas
	$PopObj/Casa_progress.value = GlobalVar.casas
	$PopObj/Casa_obj.text = 'Construa ' + str(GlobalVar.obj_casas) + ' casas'
	if GlobalVar.casas >= GlobalVar.obj_casas:
		$PopObj/Casa_progress/Label.text = 'Concluído'
	else:
		$PopObj/Casa_progress/Label.text = str(GlobalVar.casas) + '/' + str(GlobalVar.obj_casas)

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
