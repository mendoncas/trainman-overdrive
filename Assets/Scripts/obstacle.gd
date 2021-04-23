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

func _on_Area_body_entered(body):
	if body.name == "player" && !$mesh/body/collision.disabled:
		body.lose_will()
	pass # Replace with function body.
