extends Node

func _ready():
	BackgroundMusic.parar()
	if GlobalVar.tutorial:
		$Objetivo/Iniciar_proj/BotaoProx.visible = true
		$Tutorial/Popup0.popup_centered()

func _on_Popup0_popup_hide():
	$Tutorial/Popup1.popup()

func _on_Popup1_popup_hide():
	$Tutorial/Popup2.popup()

func _on_Popup2_popup_hide():
	$Tutorial/Popup3.popup()

func _on_Popup3_popup_hide():
	$Objetivo/Iniciar_proj/BotaoProx.visible = false
