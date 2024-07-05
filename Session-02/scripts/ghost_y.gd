extends CharacterBody2D

@export var SPEED = 300.0

var direction_y = 0

func _ready():
	direction_y = 1

func _physics_process(delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _on_area_2d_area_entered_right(area):
	print(area.name)
	direction_y = direction_y * -1

func _on_area_2d_area_entered_left(area):
	print(area.name)
	direction_y = direction_y * -1
