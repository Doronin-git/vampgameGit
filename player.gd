extends CharacterBody2D

signal health_deplited
var health = Global.player_max_health

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * Global.player_speed
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
		%ProgressBar.max_value = Global.player_max_health
		if health <= 0.0:
			health_deplited.emit()
