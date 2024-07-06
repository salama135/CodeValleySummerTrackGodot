extends Area2D

@onready var game_manager = %GameManager

func _on_body_entered(body):
	if(body is character):
		queue_free();
		game_manager.add_score();

