extends Sprite2D

@export var list_of_positions: Array[Marker2D] = []
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_mole_timeout():
	var my_random_number = rng.randf_range(0, 9)
	self.set_position(list_of_positions[my_random_number].global_position)
