extends CharacterBody2D
signal death

func _physics_process(delta):
	velocity.x = -100
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider():
			if collision.get_collider().name=="Player":
				emit_signal("death")
