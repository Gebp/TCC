extends Node

var tempo = 5

func _ready():
	$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
	$Dia.text = 'Dia: ' + str(GlobalVar.dia)

func _on_T_exec_timeout():
	if tempo > 0:
		tempo -= 1
		$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
	if tempo == 0 and GlobalVar.dia < 4:
		tempo = 5
		GlobalVar.dia += 1
		$Tempo_exec.text = 'Tempo: ' + str(tempo) + ' seg'
		$Dia.text = 'Dia: ' + str(GlobalVar.dia)
	elif tempo == 0 and GlobalVar.dia == 4:
		GlobalVar.sprint += 1
		if GlobalVar.sprint == GlobalVar.qtd_sprint:
			get_tree().change_scene("res://Telas/5-Resultado.tscn")
		else:
			GlobalVar.dia = 1
			get_tree().change_scene("res://Telas/3-Planejamento.tscn")
