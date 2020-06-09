extends Node
class_name BeatPlayer

onready var percPlayer = $'../PercPlayer'
onready var beatDisplay = $'../BeatDisplay'

var beat: Array = [1,0,0,1,1,0,0,0,1,0,0,1,1,0,0,0] # 8th notes
var total_length: float = (60.0 / 120.0) * 8.0 # tempo of 128 bpm, 8 total beats

var is_playing = false
var elapsed_time: float = 0
var next_hit_index: int = 0
var next_hit_time: float = 0
var is_matching: bool = false

func _ready() -> void:
	pass


func start_play():
	print("play")
	set_next_hit_time()
	is_playing = true
	is_matching = false
	

func start_match():
	print("match")
	set_next_hit_time()
	is_playing = true
	is_matching = true	


func _process(delta: float) -> void:
	if is_playing:
		play(delta)
		
		
func play(delta: float):
	print(next_hit_time)
	if elapsed_time >= next_hit_time:
		beatDisplay.pulse(next_hit_index)
		var perc_type = beat[next_hit_index]
		if perc_type > 0:
			if !is_matching: percPlayer.play(perc_type)
			beatDisplay.activate(next_hit_index)

		next_hit_index += 1
		if next_hit_index == beat.size():
			stop()
		else:
			set_next_hit_time()
	
	elapsed_time += delta		
			

func stop():
	is_playing = false
	elapsed_time = 0
	next_hit_index = 0
	next_hit_time = 0
	beatDisplay.deactivateAll()


func pause():
	is_playing = false;


func resume():
	elapsed_time = next_hit_time
	is_playing = true

func set_next_hit_time():
	next_hit_time = float(next_hit_index) * total_length / beat.size();
