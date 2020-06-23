extends StaticBody2D
class_name PlatformSource

var perc_colors = {
	G.Perc.KICK: Color.red,
	G.Perc.SNARE: Color.blue,
}

export var perc = G.Perc.KICK
var color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color = perc_colors[perc]
	$ColorRect.color = color


func _on_Platform_input_event(_viewport, event: InputEvent, _shape_idx):
	if event.is_action_pressed('ui_lmb'):
		get_tree().set_input_as_handled()
		var platform = preload("res://Platform.tscn").instance()
		platform.position = Vector2(0,0)
		platform.prev_mouse_pos = event.position
		platform.perc = perc
		platform.set_color(color)
		add_child(platform)
