extends "res://entities/weapons/weapon.gd"
const SCENE_BULLET = preload("res://entities/weapons/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func facing(_attack_angle):
	var b = SCENE_BULLET.instance()
	add_child(b)
	b.add_to_group("weapons")
	b.transform = $Muzzle.transform
	position.x = 8
	position.y = 16
	z_index = 11
	# Just make sure we attach Down always. We arn't doing any uppercuts!
	START_ANGLE = _attack_angle
	END_ANGLE = _attack_angle
