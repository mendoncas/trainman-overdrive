extends KinematicBody

var speed = 30

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var move = Vector3()
	move.z = move.z - speed
	move_and_slide(move)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
