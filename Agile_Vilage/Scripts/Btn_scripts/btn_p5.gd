extends Control

func _on_Reiniciar_pressed():
	# Reseta os valores dos contadores ao reiniciar
	# Validador do tutorial
	GlobalVar.tutorial = false
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
	GlobalVar.moeda = 0
	# Limitadores
	GlobalVar.limite_energia = 10
	GlobalVar.limite_madeira = 20
	GlobalVar.limite_pedra = 20
	GlobalVar.limite_areia = 20
	GlobalVar.limite_minerais = 20
	GlobalVar.limite_carvao = 20
	# Limitadores de recursos processados
	GlobalVar.limite_vidro = 10
	GlobalVar.limite_moeda = 15
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
	# Validadores de resultado e eventos
	GlobalVar.bonus_energia = 0
	GlobalVar.onus_energia = 0
	GlobalVar.encerramento = false
	GlobalVar.micro_eventos = 0
	GlobalVar.eventos_inevitaveis = 0
	GlobalVar.eventos_selecionaveis = 0
	GlobalVar.t_energia = 10
	GlobalVar.t_madeira = 0
	GlobalVar.t_pedra = 0
	GlobalVar.t_areia = 0
	GlobalVar.t_minerais = 0
	GlobalVar.t_carvao = 0
	GlobalVar.t_vidro = 0
	GlobalVar.t_moeda = 0
	# Melhorias
	GlobalVar.a_limite_madeira = 0
	GlobalVar.a_limite_pedra = 0
	GlobalVar.a_limite_areia = 0
	GlobalVar.a_limite_minerais = 0
	GlobalVar.a_limite_carvao = 0
	GlobalVar.a_limite_vidro = 0
	GlobalVar.a_limite_moeda = 0
	GlobalVar.conhecimento = 1
	get_tree().change_scene("res://Telas/1-MenuInicial.tscn")

func _on_Reiniciar_mouse_entered():
	self.modulate = 'd2d2d2'

func _on_Reiniciar_mouse_exited():
	self.modulate = 'ffffff'
