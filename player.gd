extends CharacterBody2D

signal health_deplited

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length()>0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
		

	const DAMAGE_RATE = 15.0
	var overlapping = %Hurtbox.get_overlapping_bodies()
	if overlapping.size() > 0:
		health -= DAMAGE_RATE * overlapping.size() * delta
		%ProgressBar.value = health
		%ProgressBar.max_value = 100
		if health <= 0.0:
			health_deplited.emit()
