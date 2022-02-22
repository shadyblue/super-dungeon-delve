extends Player
class_name PLizard

func _ready():
	rng.randomize()
	var zoom_factor = .2
	#print("zoom_factor: ", zoom_factor)
	$Camera2D.zoom = Vector2(zoom_factor, zoom_factor)
	
func _physics_process(delta):
	var test = 1
	
