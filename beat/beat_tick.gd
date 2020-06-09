extends ColorRect
class_name BeatTick

enum TickType {
	DOWNBEAT,
	ONBEAT,
	OFFBEAT
}

var pulse_scales = {
	TickType.DOWNBEAT: Vector2(1.2, 1.2),
	TickType.ONBEAT: Vector2(1.4, 1.4),
	TickType.OFFBEAT: Vector2(1.6, 1.6),
}

onready var anim_player: AnimationPlayer = $AnimationPlayer
onready var pulse_anim = anim_player.get_animation('pulse')
export(TickType) var tick_type
var initial_color = color


func pulse():
	pulse_anim.track_set_key_value(0, 1, pulse_scales[tick_type])
	anim_player.play('pulse')

func activate():
	color = Color.yellow

func deactivate():
		color = initial_color

