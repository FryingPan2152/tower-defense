extends Node3D

@export var destinaiton: Destination
var enemy_spawn_count := 0
static var enemy_s = preload("res://Enemy.tscn")

func _on_timer_timeout() -> void:
	var enemy = enemy_s.instantiate()
	enemy.global_position = global_position
	enemy.destination = destinaiton
	enemy.health = (enemy_spawn_count*2) + 100 
	enemy.MAXHEALTH = enemy.health
	get_parent().add_child(enemy)
	enemy_spawn_count += 5
	pass # Replace with function body.
