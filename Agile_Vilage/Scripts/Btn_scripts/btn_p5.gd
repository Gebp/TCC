extends Control

func _on_Reiniciar_pressed():
	# Reseta os valores dos contadores para reiniciar
	GlobalVar.qtd_sprint = 1
	GlobalVar.sprint = 0
	GlobalVar.dia = 1
	GlobalVar.limite_energia = 10
	GlobalVar.energia = 10
	GlobalVar.madeira = 0
	GlobalVar.pedra = 0
	GlobalVar.areia = 0
	GlobalVar.minerais = 0
	get_tree().change_scene("res://Telas/1-MenuInicial.tscn")
