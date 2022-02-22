extends Player

const SCENE_SLIME = preload("res://entities/slime.tscn")

func _ready():
	rng.randomize()
	var zoom_factor = .2
	#print("zoom_factor: ", zoom_factor)
	$Camera2D.zoom = Vector2(zoom_factor, zoom_factor)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("test"):
		pass
		#globals.depth = 1
		#$"/root/Main".next_level()
	_time += delta
	_attack_cooldown -= delta
	_recoil_time -= delta
	wrapf(_time, 0, 864000)

	var direction = _get_direction()
		
	$Sprite.flip_h = true if _last_dir.x < 0 else false
	_velocity = direction  * base_speed 
	_velocity = move_and_slide(_velocity)
#	for i in get_slide_count():
#		var collision: = get_slide_collision(i)
#		if collision:
#			# Hit a monster
#			if collision.collider.is_in_group("monsters"):
#				pass
#				#print("player - hit by ", collision.collider.name)
#				#collision.collider.set("time_since_hit_player", 0.0) 
#				#take_damage(collision.normal, collision.collider.damage, collision.collider.factor)
#			# Hit a projectile
#			#if collision.collider.is_in_group("projectiles"):
#			#	take_damage(collision.normal, collision.collider.damage, collision.collider.factor)
#			#	collision.collider.queue_free()

	# Light flicker		
	$Light2D.texture_scale = light_size + (cos(_time * 9) * 0.005)
	$Light2D.energy = light_brightness + (cos(_time * 2) * 0.2)

	# Attack
	if Input.is_action_pressed("attack") and _attack_cooldown <= 0.001:
		_attack()
