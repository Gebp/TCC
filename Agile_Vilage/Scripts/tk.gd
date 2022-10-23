extends KinematicBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var chosen = false

# Evento para movimentação do cartão
func _input(event):
	if event is InputEventMouseButton:
		if chosen and event.is_pressed() && mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
		else:
			dragging = false
			chosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
			altera_pos(newPosition)

func _physics_process(delta):
	if dragging:
		move_and_slide((newPosition - position) * Vector2(30, 30))

# Armazena a nova posição do cartão
func altera_pos(newPosition):
	var item = $Texto.text
	var i = 0
	for n in GlobalVar.task:
		if n == item:
			break
		else:
			i += 1
	GlobalVar.pos[i] = newPosition

func chosen():
	chosen = true

func _on_Card_mouse_entered():
	mouse_in = true

func _on_Card_mouse_exited():
	mouse_in = false
