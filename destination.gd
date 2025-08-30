class_name Destination
extends Node3D

@onready var area:= $Area3D
@export var base_health:= 10.0

func _process(delta: float) -> void:
	if base_health <= 0.0:
		get_tree().change_scene_to_file("res://lose_screen.tscn")
	pass
	
func _physics_process(delta: float) -> void:
	
	
	for body in area.get_overlapping_bodies():
		if body is Enemy:
			
			base_health -= body.base_damage
			print(base_health)
			body.queue_free()
		if body is FlyingEnemy:
			base_health -= body.base_damage
			print(base_health)
			body.queue_free()
	pass
	
