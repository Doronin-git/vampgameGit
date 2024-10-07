extends Node2D

var spawned_mobs = 0


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	
	#waves and mob stats
func _on_timer_timeout():
	spawn_mob()
	spawned_mobs += 1
	if spawned_mobs <= 30:
		get_node("Player/Path2D/PathFollow2D/Timer").wait_time = 1
		#make wave one signal
		
	



func _on_player_health_deplited():
	%GameOver.visible = true
	get_tree().paused = true
