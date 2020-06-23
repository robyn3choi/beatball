extends Node2D
class_name Platform

var perc = G.Perc.KICK
var prev_mouse_pos = null
var is_moving = false
var is_rotating = false


func _on_Platform_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed('ui_lmb'):
		get_tree().set_input_as_handled()
		prev_mouse_pos = event.position
		is_moving = true


func _on_Rotator_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed('ui_lmb'):
		is_rotating = true


func _input(event: InputEvent):
	if !is_moving && !is_rotating: return

	if event.is_action_released(('ui_lmb')):
		prev_mouse_pos = null
		is_rotating = null
		is_moving = null

	if event is InputEventMouseMotion && is_moving:
		position += event.position - prev_mouse_pos
		prev_mouse_pos = event.position

	if is_rotating:
		look_at(event.position)
		

func set_color(color: Color):
	$ColorRect.color = color
