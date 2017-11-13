extends Node2D

onready var rabbit = get_node("kb2Rabbit")
onready var speed = 400

func _ready():
	set_fixed_process(true)
	#	print(rabbit.get_type())

func _fixed_process(delta):
	var rabbitDirection = Vector2(0,0)
	
	if (Input.is_action_pressed("ui_right")):
		print("right")
		rabbitDirection += Vector2(1,0)
	elif (Input.is_action_pressed("ui_left")):
		print("left")
		rabbitDirection += Vector2(-1,0)
	elif (Input.is_action_pressed("ui_up")):
		print("up")
		rabbitDirection += Vector2(0,-1)
	elif (Input.is_action_pressed("ui_down")):
		print("down")
		rabbitDirection += Vector2(0,1)
	
	var movement = rabbitDirection * delta * speed
	rabbit.move(movement)
	print(movement)