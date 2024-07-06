class_name ghost_x

extends CharacterBody2D

@export var SPEED = 300.0

var direction_x = 0

func _ready():
	direction_x = 1

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_2d_area_entered_right(area):
	direction_x = direction_x * -1

func _on_area_2d_area_entered_left(area):
	direction_x = direction_x * -1
