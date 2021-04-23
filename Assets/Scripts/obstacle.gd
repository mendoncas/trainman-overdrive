extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func set_collision(boolean):
	var obs = $mesh.get_child(0).get_child(0)
	obs.disabled = !boolean
	

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("obstacles")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
