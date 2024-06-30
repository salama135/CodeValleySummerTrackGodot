class_name GameManager
extends Node2D

@onready var score_label:Label = $LabelScore
@onready var timer_label:Label = $LabelTimer
@onready var game_over:Panel = $PanelGameOver
var timer:int = 15
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_label.text = str(timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer <= 0:
		game_over.visible = true
		return

func update_score():
	# update score variable
	score = score + 1
	# update socre label
	score_label.text = str(score)

func update_timer():
	# give player one more second
	timer = timer + 1
	timer_label.text = str(timer)
		

func _on_timer_game_timeout():
	if(timer == 0):
		return
	
	timer = timer - 1
	timer_label.text = str(timer)
