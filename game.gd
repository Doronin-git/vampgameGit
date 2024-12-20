extends Node2D

var score = 0
@onready var score_label = %ScoreLabel #update to show score

func _ready():
	score_label.text = str(Global.score)  # update score on the screen

func spawn_mob_moreno():
	var new_mob = preload("res://mob_big.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.connect("mob_died", Callable(self, "_on_mob_died"))  # conect mob to a signal 


func spawn_mob_verde():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	new_mob.connect("mob_died", Callable(self, "_on_mob_died"))  # conect mob to a signal 

func _on_timer_timeout():
	spawn_mob_verde()
func _on_timer_moreno_timeout():
	spawn_mob_moreno()

func _on_mob_died():
	Global.score += 75
	score_label.text = str(Global.score) # conect to label

func _on_player_health_deplited():
	get_tree().change_scene_to_file("res://game_over.tscn")
	
