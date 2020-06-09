extends Node
class_name BeatMatcher

var window = 0.5

onready var beat_player: BeatPlayer = $'../BeatPlayer'
onready var next_perc = beat_player.beat[0]
var next_perc_index = 0
var is_waiting_for_ball_hit = false
var elapsed_wait_time = 0

var index: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# if next_perc_index > 0:
	# 	elapsed_time += delta
	# 	if (elapsed_time > next_perc_time + window): reset()
	if is_waiting_for_ball_hit:
		elapsed_wait_time += delta
		if elapsed_wait_time > beat_player.next_hit_time + window: 
			reset()

	if !is_waiting_for_ball_hit && next_perc_index > 0 && next_perc_index == beat_player.next_hit_index:
		is_waiting_for_ball_hit = true
		elapsed_wait_time = beat_player.elapsed_time
		beat_player.pause()


func played_perc(perc) -> void:
	if played_next_perc(perc):
		if next_perc_index == 0: 
			beat_player.start_match()
		else:
			beat_player.resume()

		is_waiting_for_ball_hit = false
		next_perc_index = get_next_perc_index()

		if next_perc_index == -1:
			print('DONE')
		else:
			next_perc = beat_player.beat[next_perc_index]
	else:
		reset()
		

func played_next_perc(perc):
	return perc == next_perc && played_within_window()
		

func played_within_window():
	return elapsed_wait_time < beat_player.next_hit_time + window && \
		elapsed_wait_time > beat_player.next_hit_time - window
		

func get_next_perc_index():
	for i in range(next_perc_index+1, beat_player.beat.size()):
		if beat_player.beat[i] > 0: return i
	return -1
	
	
func reset():
	next_perc = beat_player.beat[0]
	next_perc_index = 0
	is_waiting_for_ball_hit = false
	elapsed_wait_time = 0
	beat_player.stop()
		
