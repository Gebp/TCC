extends Node2D

var r = RandomNumberGenerator.new()
# Probabilidade de um evento bo ocorrer
var re_b = RandomNumberGenerator.new()
# probabilidade de um evento ruim ocorrer
var re_o = RandomNumberGenerator.new()

# nivel de alteração da energia
var re_e = RandomNumberGenerator.new()

func _ready():
	# Condição para a sprint 0 ser a mais ideal possível
	if GlobalVar.sprint > 0:
		eventos()

# Conforme a aquantidade de sprint
# a probabilidade de um evento aleatório ocorrer será maior
func prob_random():
	r.randomize()
	if GlobalVar.sprint >= 1 and GlobalVar.sprint < 3:
		return int(r.randf_range(1, 50))
	elif GlobalVar.sprint >= 3 and GlobalVar.sprint < 6:
		return int(r.randf_range(1, 75))
	elif GlobalVar.sprint >= 6 and GlobalVar.sprint < 11:
		return int(r.randf_range(1, 100))
	else:
		return int(r.randf_range(1, 500))

func energia_random():
	re_e.randomize()
	return int(re_e.randf_range(1, 5))

# Função dos eventos aleatórios
func eventos():
	re_o = prob_random()
	# eventos negativos
	if re_o >= 45:
		GlobalVar.limite_energia -= energia_random()
		if GlobalVar.limite_energia <= 0:
			GlobalVar.limite_energia = 1
	
	re_b = prob_random()
	# eventos positivos
	if re_b >= 45:
		GlobalVar.limite_energia += energia_random()
