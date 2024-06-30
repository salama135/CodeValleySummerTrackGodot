extends AnimatedSprite2D

@export var speed = 350
@export var game_manager:GameManager
@onready var hammer_collider:CollisionShape2D = $Area2Dhammer2/CollisionShape2Dhammer
@onready var bonk:AudioStreamPlayer = $Bonk2

var velocity = Vector2.ZERO
var screensize = Vector2(480, 720)

# Called when the node enters the scene tree for the first time.
func _ready():
	hammer_collider.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# check if game is over or not 
	
	play_hammer_animation()
	move_hammer(_delta)


func _on_area_2d_area_entered(area):
	if(area.name == "Area2Dmole"):
		
		game_manager.update_score()
		game_manager.update_timer()
		
		# disable hammer collider
		hammer_collider.disabled = true
		# play bonk sound
		bonk.play()
		

func _on_animation_finished():
	hammer_collider.disabled = true


func move_hammer(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Move the player's position
	position += velocity * speed * delta
	# don't move out of screen bounds
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)


func play_hammer_animation():
	if Input.is_action_just_pressed("hammer"):
		self.play("hammer")
		hammer_collider.disabled = false

