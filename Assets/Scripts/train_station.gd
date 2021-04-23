extends Spatial

var punctuation = 0 
var wagons = ["yellowtrain", "redtrain", "bluetrain"]

func _on_Area_body_exited(body):
	if(body.name == 'player'):
		print("Você cruzou uma estação! Atualizando vagão e estoque de carvão...")
		print("pontuação da corrida: ", _points(body))
		print("você recebeu um vagão ", _give_wagon_to_player(body))
		body.points = punctuation


func _give_wagon_to_player(player):
	get_tree().call_group("wagon", "hide")
	var wagon = wagons[(randi() % 3)]
	
	if !(player.has_collided && player.wagon == "yellowtrain"):
		player.has_collided = false
	
	if player.wagon == "yellowtrain":
		player.coal += 4

	player.max_speed = 30
	player.wagon = wagon
	return wagon


func _points(player):
	var points =int(10 * (30 - $Timer.reset()))
	
	if player.wagon == "redtrain":
		points *= 2
	
	elif player.wagon == "yellowtrain" and player.has_collided:
		points /= 2
		player.has_collided = true

	elif player.wagon == "bluetrain" and player.has_collided:
		points /= 2
	
	punctuation += points

	return points
	
	


