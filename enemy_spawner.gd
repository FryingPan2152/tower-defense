extends Node3D

@export var destinaiton: Destination

func _on_timer_timeout() -> void:
	var enemy = preload("res://Enemy.tscn").instantiate()
	enemy.global_position = global_position
	enemy.destination = destinaiton
	get_parent().add_child(enemy)
	pass # Replace with function body.
