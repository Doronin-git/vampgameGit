extends CharacterBody2D

var mob_health = Global.mob_max_health
var player_damage = Global.player_damage
var mob_speed = Global.mob_speed

signal mob_died

@onready var player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * mob_speed
	move_and_slide()	
	
func take_damage():
	mob_health -= player_damage
	%Slime.play_hurt()
	
	if mob_health <= 0:
		emit_signal("mob_died") 
		queue_free()
		
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
