extends Spatial

var punctuation = 0

func _ready():
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if(body.name == 'player'):
		print("Você cruzou uma estação! Atualizando vagão e estoque de carvão...")
		punctuation+=100/(30 - $Timer.reset())
		print("sua pontuação agora é: ", punctuation)
