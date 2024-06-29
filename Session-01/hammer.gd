extends AnimatedSprite2D

@export var speed = 350
@export var hammer_collider:CollisionShape2D
@export var score_label:Label
@export var timer_label:Label
@export var timer:int = 15
@export var game_over:Panel
@export var bonk:AudioStreamPlayer

var score = 0
var velocity = Vector2.ZERO
var screensize = Vector2(480, 720)

# Called when the node enters the scene tree for the first time.
func _ready():
	hammer_collider.disabled = true
	timer_label.text = str(timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# check if game is over or not 
	if timer <= 0:
		game_over.visible = true
		return
	
	play_hammer_animation()
	move_hammer(_delta)


func _on_area_2d_area_entered(area):
	if(area.name == "Area2Dmole"):
		# update score variable
		score = score + 1
		# update socre label
		score_label.text = str(score)
		# disable hammer collider
		hammer_collider.disabled = true
		# give player one more second
		timer = timer + 1
		timer_label.text = str(timer)
		# play bonk sound
		bonk.play()
		


func _on_timer_game_timeout():
	if(timer == 0):
		return
	
	timer = timer - 1
	timer_label.text = str(timer)


func _on_animation_finished():
	hammer_collider.disabled = true


func move_hammer(delta):
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Move the player's position
	position += velocity * speed * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)

func play_hammer_animation():
	if Input.is_action_just_pressed("hammer"):
		self.play("hammer")
		hammer_collider.disabled = false
