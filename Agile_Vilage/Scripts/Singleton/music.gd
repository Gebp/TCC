extends Node

var background = load('res://Audio/Background-Music.mp3')

func tocar():
	$Music.stream = background
	$Music.play()

func parar():
	$Music.stop()
