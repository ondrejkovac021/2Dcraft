extends KinematicBody2D

const up = Vector2(0,-1)
const Gravity = 30
const fallspeed = 400
const maxspeed = 300
const jump = 800
var motion = Vector2()

func _ready():
	pass

func _physics_process(_delta):
	if !is_on_floor():
		motion.y += Gravity

	if motion.y > fallspeed:
		motion.y = fallspeed
	
	if Input.is_action_pressed("move_right"):
		motion.x = maxspeed
	elif Input.is_action_pressed("move_left"):
		motion.x = -maxspeed
	else:
		motion.x = 0

	if is_on_floor():
		if Input.is_action_pressed("move_up"):
			motion.y = -jump

	motion = move_and_slide(motion,up)
