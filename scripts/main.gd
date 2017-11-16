extends Node2D

onready var rabbit = get_node("kb2Rabbit")
onready var rabbitWalkSound = rabbit.get_node("smpSRwalk")
onready var speed = 400

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	#	print(rabbit.get_type())

func _fixed_process(delta):
	var rabbitSprite = rabbit.get_node("SuperRabitRPGstyle")
	var rabbitDirection = Vector2(0,0)
	
	if (Input.is_action_pressed("ui_right")):
		rabbitSprite.set_frame(0)
		rabbitDirection += Vector2(1,0)
	elif (Input.is_action_pressed("ui_left")):
		rabbitSprite.set_frame(1)
		rabbitDirection += Vector2(-1,0)
	elif (Input.is_action_pressed("ui_up")):
		rabbitSprite.set_frame(2)
		rabbitDirection += Vector2(0,-1)
	elif (Input.is_action_pressed("ui_down")):
		rabbitSprite.set_frame(3)
		rabbitDirection += Vector2(0,1)
	
	var movement = rabbitDirection * delta * speed
	rabbit.move(movement)
	var parameter = Vector2(0,0)
	# CM => TODO: adjust stop_all() instant to match sample end
	if movement == parameter:
		rabbitWalkSound.stop_all()

func _input(event):
	if event.is_action_pressed("ui_right") || event.is_action_pressed("ui_left") || event.is_action_pressed("ui_up") || event.is_action_pressed("ui_down"):
		rabbitWalkSound.play("srWalk")
	#elif event.is_action_released("ui_right") || event.is_action_released("ui_left") || event.is_action_released("ui_up") || event.is_action_released("ui_down"):
	#	rabbitWalkSound.stop_all()