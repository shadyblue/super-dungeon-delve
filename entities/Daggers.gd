extends "res://entities/weapon.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func facing(_attack_angle):
	position.x = 8
	position.y = 16
	z_index = 11
	# Just make sure we attach Down always. We arn't doing any uppercuts!
	START_ANGLE = _attack_angle
	END_ANGLE = _attack_angle
