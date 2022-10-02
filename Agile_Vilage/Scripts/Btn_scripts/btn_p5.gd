extends Control

func _on_Reiniciar_pressed():
	# Reseta os valores dos contadores ao reiniciar
	# Contadores e validadores de tempo
	GlobalVar.qtd_sprint = 1
	GlobalVar.sprint = 0
	GlobalVar.dia = 1
	# Contadores de recursos
	GlobalVar.energia = 10
	GlobalVar.madeira = 0
	GlobalVar.pedra = 0
	GlobalVar.areia = 0
	GlobalVar.minerais = 0
	GlobalVar.carvao = 0
	# Contadores de recursos processados
	GlobalVar.vidro = 0
	# Limitadores
	GlobalVar.limite_energia = 10
	GlobalVar.limite_madeira = 20
	GlobalVar.limite_pedra = 20
	GlobalVar.limite_areia = 20
	GlobalVar.limite_minerais = 20
	GlobalVar.limite_carvao = 20
	# Limitadores de recursos processados
	GlobalVar.limite_vidro = 10
	# Contadores para validação dos objetivos
	GlobalVar.casas = 0
	GlobalVar.torres = 0
	GlobalVar.muros = 0
	GlobalVar.fazendas = 0
	# Contadores de objetivos
	GlobalVar.obj_casas = 0
	GlobalVar.obj_torres = 0
	GlobalVar.obj_muros = 0
	GlobalVar.obj_fazendas = 0
	# Validador do objetivo selecionado
	GlobalVar.obj = 0
	get_tree().change_scene("res://Telas/1-MenuInicial.tscn")

func _on_Reiniciar_mouse_entered():
	self.modulate = 'd2d2d2'

func _on_Reiniciar_mouse_exited():
	self.modulate = 'ffffff'
