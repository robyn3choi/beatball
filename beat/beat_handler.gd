extends Node
class_name BeatHandler

func _on_PlayBeatBtn_pressed():
	$BeatPlayer.start_play()

func _on_Ball_hit_platform(perc) -> void:
	$BeatMatcher.played_perc(perc)
	$PercPlayer.play(perc)
