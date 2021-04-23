extends KinematicBody

var max_speed = 30
var speed = 10
var gravity = 5
var coal = 5
var acceleration = -2
var on_rails = true
var will = 3
var wagon
var has_collided = false
var points = 0
# Called when the node enters the scene tree for the first time.

	
func _process(delta):
	var path
	if wagon == "yellowtrain":
		path = $Camera/CanvasLayer/yellowtrain
	elif wagon == "bluetrain":
		path = $Camera/CanvasLayer/bluetrain
	elif wagon == "redtrain":
		path = $Camera/CanvasLayer/redtrain
	if path:
		path.show()
 
	
	$Camera/CanvasLayer/coal_label.set_text(str(coal)) 
	$Camera/CanvasLayer/points_label.set_text(str(points))

func _physics_process(delta):
	var move = Vector3()

	if on_rails:
		acceleration = 3
	else: 
		acceleration = -5
	
	speed+=acceleration

	if speed > max_speed:
		speed = max_speed
	
	elif speed < 5:
		speed = 5
	
	else:
		speed+=acceleration

	if Input.is_action_pressed("left"):
		move.x -= 7
		
	if Input.is_action_pressed("right"):
		move.x += 4
	
	if Input.is_action_just_pressed("jump"):
		move.y += 95

	if Input.is_action_just_pressed("eat"):
		eat_coal()

	move.z -= speed
	move.y -= gravity
	move_and_slide(move)

	
func lose_will():
	has_collided = true
	will -= 1
		
	if will == 2:
		$Camera/CanvasLayer/heart3.hide()
	elif will == 1:
		$Camera/CanvasLayer/heart2.hide()
	if will == 0 or wagon == 'redtrain':
		get_parent().game_over()


func eat_coal():
	if coal > 0:
		coal -= 1
		max_speed += 10
