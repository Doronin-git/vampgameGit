extends Node2D


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _ready():
	%Shop_money_label.text = str(Global.score)
