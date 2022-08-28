extends Node

var tempo = 60

func _ready():
	$Tempo_exec.text = str(tempo)

func _on_Timer_timeout():
	if tempo > 0:
		tempo -= 1
		$Tempo_exec.text = str(tempo)
