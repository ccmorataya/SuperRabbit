extends Node2D

onready var rabbit = get_node("kb2Rabbit")
onready var speed = 400

func _ready():
	set_fixed_process(true)
	#	print(rabbit.get_type())

func _fixed_process(delta):
	var rabbitSprite = rabbit.get_node("SuperRabitRPGstyle")
	var rabbitDirection = Vector2(0,0)
	
	if (Input.is_action_pressed("ui_right")):
		print("right")
		rabbitSprite.set_frame(0)
		rabbitDirection += Vector2(1,0)
	elif (Input.is_action_pressed("ui_left")):
		print("left")
		rabbitSprite.set_frame(1)
		rabbitDirection += Vector2(-1,0)
	elif (Input.is_action_pressed("ui_up")):
		print("up")
		rabbitDirection += Vector2(0,-1)
		rabbitSprite.set_frame(2)
	elif (Input.is_action_pressed("ui_down")):
		print("down")
		rabbitSprite.set_frame(3)
		rabbitDirection += Vector2(0,1)
	
	var movement = rabbitDirection * delta * speed
	rabbit.move(movement)
	print(movement)