extends "res://entities/weapon.gd"
export var speed = 200
export (PackedScene) var Projectile

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	prints('wand')
	pass # Replace with function body.


func facing(_attack_angle):
	position.x = 8
	position.y = 16
	z_index = 11

	var p = Projectile.instance(_attack_angle)
	owner.add_child(p)
	p.transform = $Muzzle.transform
