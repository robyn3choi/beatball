extends RigidBody2D

signal hit_platform(perc)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Ball_body_entered(body: Node):
	if body.get_name() == "Platform":
		emit_signal("hit_platform", body.perc)


func _on_PlayBeatBtn_pressed() -> void:
	pass # Replace with function body.
