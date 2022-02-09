extends KinematicBody2D

var START_ANGLE = -45
var END_ANGLE = 45
var rng: = RandomNumberGenerator.new()

func facing(_attack_angle):
	pass

func _ready():
	rng.randomize()
	$SfxSwipe.pitch_scale = rng.randf_range(0.9, 1.8)
	$SfxSwipe.play(0.0)
	$AnimationPlayer.get_animation("attack").track_set_key_value(0, 0, START_ANGLE+90)
	$AnimationPlayer.get_animation("attack").track_set_key_value(0, 1, END_ANGLE+90)
	
	$AnimationPlayer.play("attack", -1, 5.0)


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
