extends Node2D

func _ready():
	BackgroundMusic.tocar()
	$CheckBox.pressed = GlobalVar.tutorial

func _on_CheckBox_pressed():
	if GlobalVar.tutorial:
		GlobalVar.tutorial = false
	else:
		GlobalVar.tutorial = true

func _on_Iniciar_pressed():
	get_tree().change_scene("res://Telas/2-SelecionarObjetivo.tscn")
