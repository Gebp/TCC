extends Container
class_name Arrastavel

var id: int
var texto: String

var dropped_on_target: bool = false

func _ready():
	add_to_group('Card')
	$Card/Texto.text = texto

#func get_drag_data(_position: Vector2):
#	if not dropped_on_target:
#		set_drag_preview(_get_preview_control())
#		return self

#func _on_item_dropped_on_target(arrastavel):
#	if arrastavel.get('id') != id:
#		return
#	queue_free()

#func _get_preview_control():
#	pass
