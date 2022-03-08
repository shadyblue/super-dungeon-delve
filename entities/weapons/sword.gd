extends Weapon

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func facing(_attack_angle):
	position.x = 8
	position.y = 16
	z_index = 11
	# Just make sure we attach Down always. We arn't doing any uppercuts!
	if _attack_angle < -90 or _attack_angle >90:
		START_ANGLE = _attack_angle +45
		END_ANGLE = _attack_angle -45
	else:
		START_ANGLE = _attack_angle -45
		END_ANGLE = _attack_angle + 45



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
