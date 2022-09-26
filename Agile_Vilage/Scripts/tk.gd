extends KinematicBody2D

var distancia
var dir
var arrasta
var nPos = Vector2()

var mouse_in = false
var sel = false

func _input(event):
	if event is InputEventMouseButton:
		if sel and event.is_pressed() && mouse_in:
			distancia = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			arrasta = true
			nPos = get_viewport().get_mouse_position() - distancia * dir
		else:
			arrasta = false
			sel = false
		
	elif event is InputEventMouseMotion:
		if arrasta:
			nPos = get_viewport().get_mouse_position() - distancia * dir

func _physics_process(delta):
	if arrasta:
		move_and_slide((nPos - position) * Vector2(30, 30))


func _on_Card_mouse_entered():
	mouse_in = true

func _on_Card_mouse_exited():
	mouse_in = false
