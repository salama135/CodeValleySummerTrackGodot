extends Node

@onready var game_over_panel:Panel = $PanelGameOver
var is_game_over:bool = false

@onready var score_label:Label = $LabelScore
@onready var lifes_label:Label = $LabelLifes

@export var max_lifes:int = 3

var score:int = 0
var lifes:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	lifes = max_lifes
	set_lifes_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_life():
	if lifes == max_lifes:
		return
	lifes = lifes + 1 
	set_lifes_label()

func subtract_life():
	if lifes == 0:
		game_over()
		return
	lifes = lifes - 1
	set_lifes_label()
	
func add_score():
	score = score + 1
	set_score_label()

func game_over():
	if lifes == 0:
		is_game_over = true
		game_over_panel.visible = true

func set_lifes_label():
	lifes_label.text = "Lifes: " + str(lifes)

func set_score_label():
	score_label.text = "Score: " + str(score)
