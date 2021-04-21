extends Spatial

func _ready():
	add_to_group("road")
	pass


func to_be_moved():
	if self.name == ("road" + str(get_parent().roads_order[get_parent().index])):
		get_parent().move_road()	
