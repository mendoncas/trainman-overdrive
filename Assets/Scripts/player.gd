extends KinematicBody

var max_speed = 30
var speed = 10
var gravity = 5
var jumping = false
var coal = 5
var acceleration = 3
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var move = Vector3()
	
	if speed < max_speed && speed > 3:
		speed+=acceleration
	
	if Input.is_action_pressed("left"):
		move.x -= 7
		
	if Input.is_action_pressed("right"):
		move.x += 4
	
	if Input.is_action_pressed("jump"):
		move.y += 13

	move.z -= speed
	move.y -= gravity
	move_and_slide(move)
