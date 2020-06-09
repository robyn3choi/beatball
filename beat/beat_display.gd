extends Node2D
class_name BeatDisplay

onready var initial_color = get_child(0).color

func pulse(index: int):
	get_child(index).pulse();

func activate(index: int):
	get_child(index).activate()

func deactivateAll():
	for child in get_children():
		child.deactivate();
