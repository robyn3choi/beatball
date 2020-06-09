extends StaticBody2D
class_name Platform

var perc = G.Perc.KICK
var prev_mouse_pos = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Platform_input_event(viewport, event: InputEvent, shape_idx):
	if event.is_action_pressed('ui_lmb'):
		get_tree().set_input_as_handled()
		prev_mouse_pos = event.position
		
func _input(event: InputEvent):
	if not prev_mouse_pos:
		return
	if event.is_action_released(('ui_lmb')):
		prev_mouse_pos = null
	if event is InputEventMouseMotion:
		position += event.position - prev_mouse_pos
		prev_mouse_pos = event.position
