extends Node2D

var speed_upgrade_cost =
var hp_upgrade_cost =
var damage_upgrade_cost =
var reload_upgrade_cost =

func havemoney(upgrade_cost): 
	if Global.score > upgrade_cost:
		return true


func _on_restart_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _ready():
	%Shop_money_label.text = str(Global.score)


func _on_upgrade_speed_pressed() -> void:
	pass
	


func _on_upgrade_hp_pressed() -> void:
	pass # Replace with function body.


func _on_upgrade_damage_pressed() -> void:
	pass # Replace with function body.


func _on_upgrade_reload_pressed() -> void:
	pass # Replace with function body.
