extends Node

var r = RandomNumberGenerator.new()

# Função para deixar os ganhos de maeriasi de forma randômica, replicado para todos os tipo
func randomizar_ganhos() -> int:
	r.randomize()
	return int(r.randf_range(1, 3))

func reduzir_energia():
	GlobalVar.energia -= 1
	$Menu_lateral/EnergiaBar.value = GlobalVar.energia
	$Menu_lateral/Energia.text = str(GlobalVar.energia) + '/' + str(GlobalVar.limite_energia)

func _on_BtnMadeira_pressed():
	if GlobalVar.energia >0:
		GlobalVar.madeira += randomizar_ganhos()
		$Menu_lateral/Madeira.text = 'Madeira: ' + str(GlobalVar.madeira)
		reduzir_energia()

func _on_BtnPedra_pressed():
	if GlobalVar.energia >0:
		GlobalVar.pedra += randomizar_ganhos()
		$Menu_lateral/Pedra.text = 'Pedra: ' + str(GlobalVar.pedra)
		reduzir_energia()

func _on_BtnAreia_pressed():
	if GlobalVar.energia >0:
		GlobalVar.areia += randomizar_ganhos()
		$Menu_lateral/Areia.text = 'Areia: ' + str(GlobalVar.areia)
		reduzir_energia()

func _on_BtnMinerais_pressed():
	if GlobalVar.energia >0:
		GlobalVar.minerais += randomizar_ganhos()
		$Menu_lateral/Minerais.text = 'Madeira: ' + str(GlobalVar.minerais)
		reduzir_energia()
