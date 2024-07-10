extends Node2D


func _draw():
	draw_line(Vector2(0, 0), Vector2(0, 100), Color.GREEN, 2)
	draw_line(Vector2(0, 100), Vector2(100, 100), Color.RED, 2)
	draw_line(Vector2(100, 100), Vector2(100, 0), Color.YELLOW, 2)
	draw_line(Vector2(100, 0), Vector2(0, 0), Color.WHITE, 2)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
