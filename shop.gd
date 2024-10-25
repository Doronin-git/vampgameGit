extends Node2D



func havemoney(upgrade_cost): 
	if Global.score >= upgrade_cost:
		return true
	else:
		return false

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _ready():
	%Shop_money_label.text = str(Global.score)
	%speed_cost.text = str(Global.speed_upgrade_cost)
	%actual_speed.text = str(Global.player_speed)
	%hp_cost.text = str(Global.hp_upgrade_cost)
	%actual_hp.text = str(Global.player_max_health)
	%damage_cost.text = str(Global.damage_upgrade_cost)
	%actual_damage.text = str(Global.player_damage)
	%reload_cost.text = str(Global.reload_upgrade_cost)
	%actual_reload.text = str(Global.player_attak_rate)
	
	
func _on_upgrade_speed_pressed() -> void:
	if havemoney(Global.speed_upgrade_cost) == true:
		Global.player_speed += 30 
		Global.score -= Global.speed_upgrade_cost
		Global.speed_upgrade_cost += 40
		%Shop_money_label.text = str(Global.score)
		%speed_cost.text = str(Global.speed_upgrade_cost)
		%actual_speed.text = str(Global.player_speed)


func _on_upgrade_hp_pressed() -> void:
	if havemoney(Global.hp_upgrade_cost) == true:
		Global.player_max_health += 10 
		Global.score -= Global.hp_upgrade_cost
		Global.hp_upgrade_cost += 40
		%Shop_money_label.text = str(Global.score)
		%hp_cost.text = str(Global.hp_upgrade_cost)
		%actual_hp.text = str(Global.player_max_health)


func _on_upgrade_damage_pressed() -> void:
	if havemoney(Global.damage_upgrade_cost) == true:
		Global.player_damage += 2.0 
		Global.score -= Global.damage_upgrade_cost
		Global.damage_upgrade_cost += 40
		%Shop_money_label.text = str(Global.score)
		%damage_cost.text = str(Global.damage_upgrade_cost)
		%actual_damage.text = str(Global.player_damage)


func _on_upgrade_reload_pressed() -> void:
	if havemoney(Global.reload_upgrade_cost) == true:
		Global.player_attak_rate -= 0.05 
		Global.score -= Global.reload_upgrade_cost
		Global.reload_upgrade_cost += 50
		%Shop_money_label.text = str(Global.score)
		%reload_cost.text = str(Global.reload_upgrade_cost)
		%actual_reload.text = str(Global.player_attak_rate)
