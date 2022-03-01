extends KinematicBody2D

var speed = 300

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("monsters"):
		body.queue_free()
	queue_free()
