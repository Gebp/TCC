extends Control

func _on_Continuar_pressed():	
	if GlobalVar.dia < 4:
		GlobalVar.dia += 1
		GlobalVar.energia = GlobalVar.limite_energia
		get_tree().change_scene("res://Telas/4-Execucao.tscn")
	elif GlobalVar.sprint == GlobalVar.qtd_sprint:
		get_tree().change_scene("res://Telas/5-Resultado.tscn")
	else:
		GlobalVar.dia = 1
		GlobalVar.sprint += 1
		get_tree().change_scene("res://Telas/3-Planejamento.tscn")

func _on_Continuar_mouse_entered():
	if GlobalVar.dia < 4:
		self.hint_tooltip = 'Clique para o próximo dia'
	else:
		self.hint_tooltip = 'Clique para conluir a Sprint'
	self.modulate = 'd2d2d2'

func _on_Continuar_mouse_exited():
	self.modulate = 'ffffff'
