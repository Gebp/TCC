extends Node

var tempo = 500

func _ready():
	$Tempo_plan.text = 'Tempo: ' + str(tempo) + ' seg'
	$Sprint.text = 'Sprint ' + str(GlobalVar.sprint)

func _on_T_plan_timeout():
	if tempo > 0:
		tempo -= 1
		$Tempo_plan.text = 'Tempo: ' + str(tempo) + ' seg'
	elif tempo == 0:
		get_tree().change_scene("res://Telas/4-Execucao.tscn")
