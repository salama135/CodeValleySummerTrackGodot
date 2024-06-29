extends AnimatedSprite2D

@export var speed = 350
@export var collider:CollisionShape2D
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
	collider.disabled = true
	timer_label.text = str(timer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer <= 0:
		return
	
	if Input.is_action_just_pressed("hammer"):
		self.play("hammer")
		collider.disabled = false
		
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Move the player's position
	position += velocity * speed * delta
	position.x = clamp(position.x, 0, screensize.x)
	position.y = clamp(position.y, 0, screensize.y)


func _on_area_2d_area_entered(area):
	if(area.name == "Area2Dmole"):
		score = score + 1
		score_label.text = str(score)
		collider.disabled = true
		timer = timer + 1
		bonk.play()
		


func _on_timer_game_timeout():
	if(timer == 0):
		game_over.visible = true
		return
	timer = timer - 1		
	timer_label.text = str(timer)


func _on_animation_finished():
	collider.disabled = true
