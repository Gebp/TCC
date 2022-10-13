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

# Limitadores
var limite_energia = 10
var limite_madeira = 20
var limite_pedra = 20
var limite_areia = 20
var limite_minerais = 20
var limite_carvao = 20

# Limitadores de recursos processados
var limite_vidro = 10

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

