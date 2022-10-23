extends Node2D

# Validador do tutorial
var tutorial = true

# Contadores e validadores de tempo
var qtd_sprint = 1
var sprint = 0
var dia = 1

# Contadores de recursos
var energia = 10
var madeira = 0
var pedra = 0
var areia = 0
var minerais = 0
var carvao = 0

# Contadores de recursos processados
var vidro = 0
var moeda = 0

# Limitadores
var limite_energia = 10
var limite_madeira = 20
var limite_pedra = 20
var limite_areia = 20
var limite_minerais = 20
var limite_carvao = 20

# Limitadores de recursos processados
var limite_vidro = 10
var limite_moeda = 15

# Contadores para validação dos objetivos
var casas = 0
var torres = 0
var muros = 0
var fazendas = 0

# Contadores de objetivos
var obj_casas = 0
var obj_torres = 0
var obj_muros = 0
var obj_fazendas = 0

# Validador do objetivo selecionado
var obj = 0

# Tasks
var task = []
var pos = []

# Validadores de resultado e eventos
var bonus_energia = 0
var onus_energia = 0
var encerramento = false
var micro_eventos = 0
var eventos_inevitaveis = 0
var eventos_selecionaveis = 0
# Validadores do total
var t_energia = 10
var t_madeira = 0
var t_pedra = 0
var t_areia = 0
var t_minerais = 0
var t_carvao = 0
var t_vidro = 0
var t_moeda = 0
# Validadores de completude [completo, sprint]
var c_obj_casas = [false, 0]
var c_obj_torres = [false, 0]
var c_obj_muros = [false, 0]
var c_obj_fazendas = [false, 0]
# Quantidade de vezes para refazer
var r_obj_casas = 0
var r_obj_torres = 0
var r_obj_muros = 0
var r_obj_fazendas = 0

# Melhorias
var a_limite_madeira = 0
var a_limite_pedra = 0
var a_limite_areia = 0
var a_limite_minerais = 0
var a_limite_carvao = 0
var a_limite_vidro = 0
var a_limite_moeda = 0
var conhecimento = 1
