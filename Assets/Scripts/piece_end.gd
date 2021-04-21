extends Area

var to_be_moved = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_piece_end_body_exited(body):
	get_parent().to_be_moved()
