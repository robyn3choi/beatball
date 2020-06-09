extends Node
class_name PercPlayer

onready var audio_stream_players = {
	G.Perc.KICK: $Kick,
	G.Perc.SNARE: $Snare,
}

func play(perc_type):
	print(self)
	audio_stream_players[perc_type].play()
