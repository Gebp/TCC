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
	if GlobalVar.energia > 0 and GlobalVar.madeira < GlobalVar.limite_madeira:
		GlobalVar.madeira += randomizar_ganhos()
		if GlobalVar.madeira > GlobalVar.limite_madeira:
			GlobalVar.madeira = GlobalVar.limite_madeira
		$Menu_lateral/Madeira.text = 'Madeira: ' + str(GlobalVar.madeira) + '/' + str(GlobalVar.limite_madeira)
		reduzir_energia()

func _on_BtnPedra_pressed():
	if GlobalVar.energia > 0 and GlobalVar.pedra < GlobalVar.limite_pedra:
		GlobalVar.pedra += randomizar_ganhos()
		if GlobalVar.pedra > GlobalVar.limite_pedra:
			GlobalVar.pedra = GlobalVar.limite_pedra
		$Menu_lateral/Pedra.text = 'Pedra: ' + str(GlobalVar.pedra) + '/' + str(GlobalVar.limite_pedra)
		reduzir_energia()

func _on_BtnAreia_pressed():
	if GlobalVar.energia > 0 and GlobalVar.areia < GlobalVar.limite_areia:
		GlobalVar.areia += randomizar_ganhos()
		if GlobalVar.areia > GlobalVar.limite_areia:
			GlobalVar.areia = GlobalVar.limite_areia
		$Menu_lateral/Areia.text = 'Areia: ' + str(GlobalVar.areia) + '/' + str(GlobalVar.limite_areia)
		reduzir_energia()

func _on_BtnMinerais_pressed():
	if GlobalVar.energia > 0 and GlobalVar.minerais < GlobalVar.limite_minerais:
		GlobalVar.minerais += randomizar_ganhos()
		if GlobalVar.minerais > GlobalVar.limite_minerais:
			GlobalVar.minerais = GlobalVar.limite_minerais
		$Menu_lateral/Minerais.text = 'Minerais: ' + str(GlobalVar.minerais) + '/' + str(GlobalVar.limite_minerais)
		reduzir_energia()