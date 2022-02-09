extends KinematicBody2D

var START_ANGLE = -45
var END_ANGLE = 45

func _ready():
	$AnimationPlayer.play("attack", -1, 5.0)
	$AnimationPlayer.get_animation("attack").track_set_key_value(0, 0, START_ANGLE+90)
	$AnimationPlayer.get_animation("attack").track_set_key_value(0, 1, END_ANGLE+90)
		
	print("start", START_ANGLE)
	print("end", END_ANGLE)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
