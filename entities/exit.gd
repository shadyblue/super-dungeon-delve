extends Node2D



func _on_Area2D_body_entered(body):
	if body == globals.player:
		queue_free()
		$"/root/Main".next_level()
