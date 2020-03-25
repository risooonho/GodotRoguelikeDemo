extends Node2D


const ConvertCoord := preload("res://library/ConvertCoord.gd")

var ref_end_turn: FuncRef

var _get_coord: ConvertCoord = ConvertCoord.new()
var _pc: Sprite


func _unhandled_input(event) -> void:
	if _pc == null:
		return

	var pos: Array = _get_coord.vector_to_array(_pc.position)
	var x: int = pos[0]
	var y: int = pos[1]

	if event.is_action_pressed("move_left"):
		x -= 1
	elif event.is_action_pressed("move_right"):
		x += 1
	elif event.is_action_pressed("move_up"):
		y -= 1
	elif event.is_action_pressed("move_down"):
		y += 1
	else:
		return

	_pc.position = _get_coord.index_to_vector(x, y)
	ref_end_turn.call_func()


func _on_InitWorld_sprite_created(new_sprite: Sprite) -> void:
	if new_sprite.name == "PC":
		_pc = new_sprite