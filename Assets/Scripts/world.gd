extends Spatial

var roads_order = ['3','1','2','4','5','6', '7']
var index = 1


func _ready():
	var children = get_children()
	print(children)
	pass
	
func move_road():
	var road = "road" + roads_order[index - 1]
	get_node(road).translate(Vector3(0, 0, -154))
	if index < len(roads_order)-1:
		index+=1
	else: 
		index = 0;
		
	for child in get_node(road).get_children():
		if child.is_in_group("obstacles"):
			if (randi()	% 101) > 80:
				child.show()
				child.set_collision(true)
			else:
				child.hide()
				child.set_collision(false)

	pass
