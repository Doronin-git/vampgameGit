extends Node2D



func _on_restart_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_shop_button_pressed():
	pass
	get_tree().change_scene_to_file("res://shop.tscn")

