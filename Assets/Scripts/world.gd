extends Spatial

var roads_order = ['3','1','2','4','5','6', '7']
var index = 1

func _ready():
	pass
	
func move_road():
	var road = "road" + roads_order[index - 1]
	get_node(road).translate(Vector3(0, 0, -154))
	if index < len(roads_order)-1:
		index+=1
	else: 
		index = 0;
	pass
