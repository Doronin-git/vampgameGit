extends Node2D

var score = 0
@onready var score_label = %ScoreLabel #update to show score

func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.connect("mob_died", Callable(self, "_on_mob_died"))  # conect mob y signal 

func _on_timer_timeout():
	spawn_mob()

func _on_mob_died():
	score += 1
	score_label.text = str(score) # conect to label

func _on_player_health_deplited():
	%GameOver.visible = true
	get_tree().paused = true
