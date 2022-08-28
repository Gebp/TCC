extends Control

func _on_Reiniciar_pressed():
	# Reseta os valores dos contadores para reiniciar
	GlobalVar.qtd_sprint = 1
	GlobalVar.sprint = 0
	GlobalVar.dia = 1
	get_tree().change_scene("res://Telas/1-MenuInicial.tscn")
